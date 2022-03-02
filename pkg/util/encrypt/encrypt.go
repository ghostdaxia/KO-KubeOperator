package encrypt

import (
	"bytes"
	"crypto/aes"
	"crypto/cipher"
	"crypto/rand"
	"encoding/base64"
	"fmt"
	"io"
	"strings"

	"github.com/containerd/containerd/log"
	"github.com/spf13/viper"
)

func padding(plaintext []byte, blockSize int) []byte {
	padding := blockSize - len(plaintext)%blockSize
	padtext := bytes.Repeat([]byte{byte(padding)}, padding)
	return append(plaintext, padtext...)
}

func unPadding(origData []byte) []byte {
	length := len(origData)
	unpadding := int(origData[length-1])
	return origData[:(length - unpadding)]
}

func AesEncrypt(origData, key []byte) ([]byte, []byte, error) {
	block, err := aes.NewCipher(key)
	if err != nil {
		return nil, origData, err
	}

	blockSize := block.BlockSize()
	origData = padding(origData, blockSize)
	blockMode := cipher.NewCBCEncrypter(block, key[:blockSize])
	crypted := make([]byte, len(origData))
	blockMode.CryptBlocks(crypted, origData)
	return crypted, origData, nil
}

func aesEncryptWithSalt(key, plaintext []byte) ([]byte, []byte, error) {
	plaintext = padding(plaintext, aes.BlockSize)
	block, err := aes.NewCipher(key)
	if err != nil {
		return nil, plaintext, err
	}
	ciphertext := make([]byte, aes.BlockSize+len(plaintext))
	iv := ciphertext[0:aes.BlockSize]
	if _, err := io.ReadFull(rand.Reader, iv); err != nil {
		return nil, plaintext, err
	}
	for i := 2; i < 8; i++ {
		iv[i] = 1
	}
	cbc := cipher.NewCBCEncrypter(block, iv)
	cbc.CryptBlocks(ciphertext[aes.BlockSize:], plaintext)
	return ciphertext, plaintext, nil
}

func aesDecrypt(key, crypted []byte) ([]byte, error) {
	block, err := aes.NewCipher(key)
	if err != nil {
		return nil, err
	}
	blockSize := block.BlockSize()
	blockMode := cipher.NewCBCDecrypter(block, key[:blockSize])
	origData := make([]byte, len(crypted))
	blockMode.CryptBlocks(origData, crypted)
	origData = unPadding(origData)
	return origData, nil
}

func aesDecryptWithSalt(key, ciphertext []byte) ([]byte, error) {
	var block cipher.Block
	block, err := aes.NewCipher(key)
	if err != nil {
		return nil, err
	}
	if len(ciphertext) < aes.BlockSize {
		return nil, fmt.Errorf("iciphertext too short")
	}
	iv := ciphertext[:aes.BlockSize]
	ciphertext = ciphertext[aes.BlockSize:]
	cbc := cipher.NewCBCDecrypter(block, iv)
	cbc.CryptBlocks(ciphertext, ciphertext)
	ciphertext = unPadding(ciphertext)
	return ciphertext, nil
}

func StringEncrypt(text string) (string, error) {
	key := viper.GetString("encrypt.key")
	pass := []byte(text)
	xpass, _, err := AesEncrypt(pass, []byte(key))
	if err == nil {
		pass64 := base64.StdEncoding.EncodeToString(xpass)
		return pass64, err
	}
	return "", err
}

func StringEncryptWithSalt(text string) (string, error) {
	key := viper.GetString("encrypt.key")
	pass := []byte(text)
	xpass, _, err := aesEncryptWithSalt([]byte(key), pass)
	if err == nil {
		pass64 := base64.StdEncoding.EncodeToString(xpass)
		return pass64, err
	}
	return "", err
}

func StringDecrypt(text string) (string, error) {
	key := viper.GetString("encrypt.key")
	bytesPass, err := base64.StdEncoding.DecodeString(text)
	if err != nil {
		return "", err
	}
	tpass, err := aesDecrypt([]byte(key), bytesPass)
	if err == nil {
		result := string(tpass[:])
		return result, err
	}
	return "", err
}

func StringDecryptWithSalt(text string) (string, error) {
	key := viper.GetString("encrypt.key")
	bytesPass, err := base64.StdEncoding.DecodeString(text)
	if err != nil {
		return "", err
	}
	tpass, err := aesDecryptWithSalt([]byte(key), bytesPass)
	if err == nil {
		result := string(tpass[:])
		return result, err
	}
	return "", err
}

func VarsEncrypt(operation string, str string, vars map[string]interface{}) map[string]interface{} {
	if vars == nil {
		return vars
	}
	for key, value := range vars {
		if operation == "ahead" {
			if strings.Contains(str, key) {
				passwd, ok := value.(string)
				if ok {
					passwdEncrypt, err := StringEncrypt(passwd)
					if err != nil {
						log.L.Errorf("string decrypt failed")
					}
					vars[key] = passwdEncrypt
				}
			}
		} else {
			if strings.Contains(key, str) {
				passwd, ok := value.(string)
				if ok {
					passwdEncrypt, err := StringEncrypt(passwd)
					if err != nil {
						log.L.Errorf("string decrypt failed")
					}
					vars[key] = passwdEncrypt
				}
			}
		}
	}
	return vars
}

func VarsDecrypt(operation string, str string, vars map[string]interface{}) map[string]interface{} {
	if vars == nil {
		return vars
	}
	for key, value := range vars {
		if operation == "ahead" {
			if strings.Contains(str, key) {
				passwd, ok := value.(string)
				if ok {
					passwdDecrypt, err := StringDecrypt(passwd)
					if err != nil {
						log.L.Errorf("string decrypt failed")
					}
					vars[key] = passwdDecrypt
				}
			}
		} else {
			if strings.Contains(key, str) {
				passwd, ok := value.(string)
				if ok {
					passwdDecrypt, err := StringDecrypt(passwd)
					if err != nil {
						log.L.Errorf("string decrypt failed")
					}
					vars[key] = passwdDecrypt
				}
			}
		}
	}
	return vars
}

func DeleteVarsDecrypt(operation string, str string, vars map[string]interface{}) map[string]interface{} {
	if vars == nil {
		return vars
	}
	for key := range vars {
		if operation == "ahead" {
			if strings.Contains(str, key) {
				delete(vars, key)
			}
		} else {
			if strings.Contains(key, str) {
				delete(vars, key)
			}
		}
	}
	return vars
}
