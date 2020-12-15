#!/bin/bash
sudo head -n1 /proc/stat > file.txt 
#s=0; #Tong phan tram CPU
s=$(awk '{ for (i = 2; i <= NF; i++) total = total+$i }; END { print total }' /home/khanhnt/file.txt);
echo "Tong luong CPU la $s"
# idle
idle=$(cut -d ' ' -f 6 /home/khanhnt/file.txt);
echo "$idle"
# luong CPU rong
free=$( echo "scale=4;$idle/$s*100" | bc );
echo "$free"
echo "Luong CPU rong la $free"
#luong CPU su dung
use=$( echo "scale=4;100-$free" | bc);
echo "$use";
# Ham lam tron
int_use=${use%.*}
echo "$int_use";
if [ $int_use -le 50 ] ;
then
	echo "OK"
elif [ $int_use -gt 50  && $int_use -lt 70 ] ;
then
	echo "warning"
else
	echo "Critical"
fi






