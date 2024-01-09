export GROOVYPATH=${HOME}/Developer/Groovy # don't forget to change your path correctly!

export PATH=${PATH}:${GROOVYPATH}/bin

if [ ! -d $GROOVYPATH ]; then mkdir -p $GROOVYPATH; fi
if [ ! -d $GROOVYPATH/src ]; then mkdir -p $GROOVYPATH/src; fi
if [ ! -d $GROOVYPATH/bin ]; then mkdir -p $GROOVYPATH/bin; fi
if [ ! -d $GROOVYPATH/log ]; then mkdir -p $GROOVYPATH/log; fi

export GROOVY_HOME=/opt/homebrew/opt/groovy/libexec