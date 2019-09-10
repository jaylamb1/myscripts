#!/bin/bash
set -a

filename=$1
n=0

declare -a MNArray
sed '/^[ \t]*$/d' $filename | while read line; do
# reading each line
echo $line
MNArray[$n]=$line
n=$((n+1))
done < $filename

#echo ""
#echo ${MNArray[*]}

echo ""
echo ""
echo $(date)
echo ""

n=0
for i in "${MNArray[@]}"
do
	echo "n = $i"
  parm="http://159.65.221.180:3001/ext/getbalance/$i"
  Addr[$n]=$(curl -s -X GET $parm)
  tempVar=${Addr[$n]}
  echo $tempVar
  #echo "Address #$($n + 1) Total= $(python -c 'import os; print "{0:,.2f}".format(float(os.environ["tempVar"]))')"
  ((++n))
done

echo "________________________"

#get change
parm6b="http://159.65.221.180:3001/ext/getbalance/GTopckRJ7f4a1VSVd2fZRTW7KGUt8JBccb"
Change=$(curl -s -X GET $parm6b)

n=0
for i in "${Addr[@]}"
do
	#echo $i
  MNTotal=$MNTotal + ${Addr[n]}
  Addr[$n]=$(curl -s -X GET $parm)
  tempVar= "${Addr[$n]}"
  echo "Address #$($n + 1) Total= $(python -c 'import os; print "{0:,.2f}".format(float(os.environ["tempVar"]))')"
  ((++n))
done


#MNTotal=$(( $MN1 + 0 + $MN2 + $MN3 + $MN4 + $MN5 + $MN6 ))
parm7="http://159.65.221.180:3001/ext/getmoneysupply"

GUAPTotal=$(curl -s -X GET $parm7)

#GUAPTotal=${GUAPTotal%%.*}
#GUAPTotal=${GUAPTotal} | sed -e 's/^[[:space:]]*//'
#export MNTotal
#export GUAPTotal
Perc=$(python -c 'import os; print "{:.2f}".format((float(os.environ["MNTotal"]) / float(os.environ["GUAPTotal"]) * 100))')

#Perc=$(( '$MNTotal / $GUAPTotal' | bc -l ))

echo "MNs Total= $(python -c 'import os; print "{0:,.3f}".format(float(os.environ["MNTotal"]) + float(os.environ["Change"]))')"
echo ""
echo ""
echo "Total GUAP Money Supply is: $(python -c 'import os; print "{0:,.5f}".format(float(os.environ["GUAPTotal"]))')"
echo ""
parm8="http://159.65.221.180:3001/ext/getmasternodecount"
MNCount=$(curl -s -X GET $parm8)
echo "Total number of GUAP masternodes: $MNCount"
echo ""
echo "Percentage of total GUAP money is: $Perc%"
echo ""
set +a
