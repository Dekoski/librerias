#!/bin/bash
df | sed -e "1d"|awk '{print $6}' |sort > temporal_1.borrar
for i in $(cat temporal_1.borrar )
	do
	for j in `grep "^$i" temporal_1.borrar`
	 do
		 if [ "$i" != "$j" ]
		 then
		 #echo "\"$i\"->\"$j\"" >> temporal_2.borrar
 		 echo "$i|$j" >> temporal_2.borrar
		 fi
		 done
 done
echo "digraph g{"
for i in `cat temporal_2.borrar `; do grep $i temporal_2.borrar ; done |sort |uniq -c |awk '$1==1 {print $2}'|awk -F"|" '{print "\""$1"\"->\""$2"\""}'
echo "}"
#| dot -Tpng |display -
rm temporal_1.borrar
rm temporal_2.borrar
