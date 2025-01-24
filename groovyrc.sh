export GROOVYPATH=${HOME}/Developer/Groovy # don't forget to change your path correctly!
export GROOVY_HOME=${LOCAL_PATH}/groovy/current

if [ ! -d $GROOVYPATH ]; then mkdir -p $GROOVYPATH; fi
if [ ! -d $GROOVYPATH/src ]; then mkdir -p $GROOVYPATH/src; fi
if [ ! -d $GROOVYPATH/bin ]; then mkdir -p $GROOVYPATH/bin; fi
if [ ! -d $GROOVYPATH/log ]; then mkdir -p $GROOVYPATH/log; fi

export GROOVY_HOME=${GROOVYPATH}

export PATH=${PATH}:${GROOVYPATH}/bin
export PATH="${LOCAL_PATH}/groovy/current/bin:${PATH}"

export GROOVY_HOME=${LOCAL_PATH}/groovy/current