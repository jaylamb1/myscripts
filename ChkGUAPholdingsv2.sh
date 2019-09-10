#!/bin/bash
set -a

filename=$1
n=0
echo ""
declare -a MNArray
while read line; do
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
  echo "Address #$($n + 1) Total= $(python -c 'import os; print "{0:,.2f}".format(float(os.environ["tempVar"]))')"
  echo ""
  ((++n))
done

echo "_____________________________"

MN_Total=0
n=0
#Add everything up
for i in "${Addr[@]}"
do
	#echo $i
  MN_Total=$((0 + $MN_Total + ${Addr[n]}))
  echo $MN_Total
  #Addr[$n]=$(curl -s -X GET $parm)
  #tempVar= "${Addr[$n]}"
  #echo "Address #$($n + 1) Total= $(python -c 'import os; print "{0:,.2f}".format(float(os.environ["tempVar"]))')"
  ((++n))
done


#MNTotal=$(( $MN1 + 0 + $MN2 + $MN3 + $MN4 + $MN5 + $MN6 ))
parm7="http://159.65.221.180:3001/ext/getmoneysupply"

GUAPTotal=$(curl -s -X GET $parm7)

#GUAPTotal=${GUAPTotal%%.*}
#GUAPTotal=${GUAPTotal} | sed -e 's/^[[:space:]]*//'
#export MNTotal
#export GUAPTotal
Perc=$(python -c 'import os; print "{:.2f}".format((float(os.environ["MN_Total"]) / float(os.environ["GUAPTotal"]) * 100))')

#Perc=$(( '$MNTotal / $GUAPTotal' | bc -l ))

echo "MNs Total= $(python -c 'import os; print "{0:,.3f}".format(float(os.environ["MN_Total"]))')"
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
