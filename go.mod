module github.com/KubeOperator/KubeOperator

go 1.14

require (
	github.com/360EntSecGroup-Skylar/excelize v1.4.1
	github.com/Azure/azure-storage-blob-go v0.10.0
	github.com/CloudyKit/jet/v3 v3.0.1 // indirect
	github.com/KubeOperator/FusionComputeGolangSDK v0.0.4
	github.com/KubeOperator/kobe v0.1.2
	github.com/Shopify/goreferrer v0.0.0-20210305184658-1a4fe54f556d // indirect
	github.com/ajg/form v1.5.1 // indirect
	github.com/aliyun/aliyun-oss-go-sdk v2.1.4+incompatible
	github.com/baiyubin/aliyun-sts-go-sdk v0.0.0-20180326062324-cfa1a18b161f // indirect
	github.com/c-robinson/iplib v0.3.1
	github.com/elazarl/goproxy v0.0.0-20190421051319-9d40249d3c2f // indirect
	github.com/elazarl/goproxy/ext v0.0.0-20220317163658-f5c0d0953e10 // indirect
	github.com/fasthttp-contrib/websocket v0.0.0-20160511215533-1f3b11f56072 // indirect
	github.com/ghodss/yaml v1.0.0
	github.com/go-git/go-git/v5 v5.2.0
	github.com/go-openapi/spec v0.19.7 // indirect
	github.com/go-openapi/swag v0.19.9 // indirect
	github.com/go-ping/ping v0.0.0-20201115131931-3300c582a663
	github.com/go-playground/locales v0.13.0
	github.com/go-playground/universal-translator v0.17.0
	github.com/go-playground/validator/v10 v10.2.0
	github.com/go-redis/redis v6.15.7+incompatible
	github.com/go-sql-driver/mysql v1.5.0
	github.com/gobuffalo/packr/v2 v2.8.0 // indirect
	github.com/gofrs/flock v0.8.0
	github.com/golang-migrate/migrate/v4 v4.12.1
	github.com/google/gofuzz v1.2.0 // indirect
	github.com/googleapis/gnostic v0.5.1 // indirect
	github.com/gophercloud/gophercloud v0.12.0
	github.com/gorilla/mux v1.8.0 // indirect
	github.com/hashicorp/errwrap v1.1.0 // indirect
	github.com/hashicorp/go-immutable-radix v1.3.0 // indirect
	github.com/hashicorp/golang-lru v0.5.4 // indirect
	github.com/imkira/go-interpol v1.1.0 // indirect
	github.com/iris-contrib/jade v1.1.4 // indirect
	github.com/iris-contrib/schema v0.0.6 // indirect
	github.com/iris-contrib/swagger/v12 v12.0.1
	github.com/jinzhu/gorm v1.9.12
	github.com/k0kubun/colorstring v0.0.0-20150214042306-9440f1994b88 // indirect
	github.com/karrick/godirwalk v1.16.1 // indirect
	github.com/kataras/golog v0.1.7 // indirect
	github.com/kataras/iris/v12 v12.1.8
	github.com/klauspost/compress v1.11.13 // indirect
	github.com/mailru/easyjson v0.7.1 // indirect
	github.com/mattn/go-colorable v0.1.8 // indirect
	github.com/microcosm-cc/bluemonday v1.0.6 // indirect
	github.com/mitchellh/mapstructure v1.1.2
	github.com/mojocn/base64Captcha v1.3.1
	github.com/moul/http2curl v1.0.0 // indirect
	github.com/mozillazg/go-pinyin v0.18.0
	github.com/onsi/ginkgo v1.14.1 // indirect
	github.com/onsi/gomega v1.10.2 // indirect
	github.com/pkg/errors v0.9.1
	github.com/pkg/sftp v1.11.0
	github.com/prometheus/common v0.13.0 // indirect
	github.com/robfig/cron/v3 v3.0.1
	github.com/rogpeppe/go-internal v1.6.2 // indirect
	github.com/russross/blackfriday v2.0.0+incompatible // indirect
	github.com/ryanuber/columnize v2.1.2+incompatible // indirect
	github.com/satori/go.uuid v1.2.0
	github.com/sirupsen/logrus v1.8.1
	github.com/spf13/viper v1.7.0
	github.com/storyicon/grbac v0.0.0-20200224041032-a0461737df7e
	github.com/swaggo/swag v1.6.5
	github.com/valyala/fasthttp v1.14.0 // indirect
	github.com/vincent-petithory/dataurl v1.0.0
	github.com/vmware/govmomi v0.23.0
	github.com/yalp/jsonpath v0.0.0-20180802001716-5cc68e5049a0 // indirect
	github.com/yudai/gojsondiff v1.0.0 // indirect
	github.com/yudai/golcs v0.0.0-20170316035057-ecda9a501e82 // indirect
	github.com/yudai/pp v2.0.1+incompatible // indirect
	golang.org/x/crypto v0.0.0-20210322153248-0c34fe9e7dc2
	golang.org/x/net v0.0.0-20210405180319-a5a99cb37ef4 // indirect
	golang.org/x/sys v0.0.0-20210403161142-5e06dd20ab57 // indirect
	golang.org/x/text v0.3.6
	google.golang.org/grpc v1.31.0 // indirect
	gopkg.in/ini.v1 v1.62.0 // indirect
	gopkg.in/yaml.v3 v3.0.0-20210107192922-496545a6307b // indirect
	helm.sh/helm/v3 v3.6.1
	k8s.io/api v0.21.0
	k8s.io/apiextensions-apiserver v0.21.0
	k8s.io/apimachinery v0.21.0
	k8s.io/cli-runtime v0.21.0
	k8s.io/client-go v0.21.0
	k8s.io/metrics v0.21.0
	rsc.io/letsencrypt v0.0.3 // indirect
)

replace (
	k8s.io/api => k8s.io/api v0.21.0
	k8s.io/apiextensions-apiserver => k8s.io/apiextensions-apiserver v0.21.0
	k8s.io/apimachinery => k8s.io/apimachinery v0.21.0
	k8s.io/client-go => k8s.io/client-go v0.21.0
	sigs.k8s.io/controller-runtime => sigs.k8s.io/controller-runtime v0.7.0
)

replace github.com/mattn/go-colorable => github.com/mattn/go-colorable v0.1.8

replace github.com/russross/blackfriday => github.com/russross/blackfriday v1.5.2

replace github.com/mattn/go-isatty => github.com/mattn/go-isatty v0.0.12

replace github.com/nats-io/nats-server/v2 => github.com/nats-io/nats-server/v2 v2.2.1

replace golang.org/x/crypto => golang.org/x/crypto v0.0.0-20210322153248-0c34fe9e7dc2
