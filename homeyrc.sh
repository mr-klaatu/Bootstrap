export HOMEYPATH=${HOME}/Developer/Homey # don't forget to change your path correctly!
export PATH=${PATH}:${HOMEYPATH}/bin

if [ ! -d $HOMEYPATH ]; then mkdir -p $HOMEYPATH; fi
if [ ! -d $HOMEYPATH/src ]; then mkdir -p $HOMEYPATH/src; fi
if [ ! -d $HOMEYPATH/pkg ]; then mkdir -p $HOMEYPATH/pkg; fi
if [ ! -d $HOMEYPATH/bin ]; then mkdir -p $HOMEYPATH/bin; fi
if [ ! -d $HOMEYPATH/log ]; then mkdir -p $HOMEYPATH/log; fi

