export GOPATH=$HOME/Develop/GO # don't forget to change your path correctly!
export GOROOT=${BREWROOT}/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

if [ ! -d $GOPATH ]; then mkdir -p $GOPATH; fi
if [ ! -d $GOPATH/src ]; then mkdir -p $GOPATH/src; fi
if [ ! -d $GOPATH/pkg ]; then mkdir -p $GOPATH/pkg; fi
if [ ! -d $GOPATH/bin ]; then mkdir -p $GOPATH/bin; fi
if [ ! -d $GOPATH/log ]; then mkdir -p $GOPATH/log; fi