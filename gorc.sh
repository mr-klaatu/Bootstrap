export GOPATH=${HOME}/Developer/GO # don't forget to change your path correctly!

export GOROOT=${HOMEBREW_ROOT}/opt/go/libexec
export PATH=${PATH}:${GOPATH}/bin:${GOROOT}/bin

if [ ! -d $GOPATH ]; then mkdir -p $GOPATH; fi
if [ ! -d $GOPATH/src ]; then mkdir -p $GOPATH/src; fi
if [ ! -d $GOPATH/pkg ]; then mkdir -p $GOPATH/pkg; fi
if [ ! -d $GOPATH/bin ]; then mkdir -p $GOPATH/bin; fi
if [ ! -d $GOPATH/log ]; then mkdir -p $GOPATH/log; fi

# Add this for go development using postgreSQL
export APP_DB_USERNAME=postgres
export APP_DB_PASSWORD=
export APP_DB_NAME=postgres

