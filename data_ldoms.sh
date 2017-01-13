#!/bin/bash
DIR="./`uname -n`_dat"
if [ ! -d $DIR ]
then
    mkdir $DIR
fi
ldm list > $DIR/ldm_list.txt
ldm list-io -p > $DIR/ldm_list_io.txt
    
for LDOM in $(ldm list | sed -e '1d'|awk '{print$1}')
do
  ldm list-constraints -p $LDOM > $DIR/$LDOM.p.txt
  ldm list-constraints -x $LDOM > $DIR/$LDOM.xml
done
tar zcf ldom_`uname -n`.tgz $DIR
