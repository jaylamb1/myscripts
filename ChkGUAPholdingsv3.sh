#!/bin/bash
set -a


echo ""
echo $(date +%a +%m-%d-%Y %H:%M:%S)
echo ""
echo "GUAP Wallet addresses read from the address file:"
echo "---------------------------------------------------"

declare -a MNArray
declare -a MNLabelArray

filename=$1
n=0
while read label address; do
# reading each line
echo "$label $address"
MNLabelArray[$n]=$label
MNArray[$n]=$address
n=$((n+1))
done < $filename

echo ""
echo ""

n=0
echo "  [ Address ]                          [ Subtotal ]"
echo "---------------------------------------------------"
echo ""

for i in "${MNArray[@]}"
do

  parm="http://159.65.221.180:3001/ext/getbalance/$i"
  Addr[$n]=$(curl -s -X GET $parm)
  tempVar=${Addr[$n]}
  tempLabel=${MNLabelArray[$n]}
  echo "$tempLabel $i = $(python -c 'import os; print "{0:,.3f}".format(float(os.environ["tempVar"]))')"
  echo ""

  ((++n))
done

echo "---------------------------------------------------"
echo "---------------------------------------------------"
MN_Total=0
n=0
#Add everything up
for i in "${Addr[@]}"
do
  tempVar=${Addr[$n]}
  #MN_Total=$((0 + $(python -c 'import os; print "{0:,.2f}".format(float(os.environ["MN_Total"]))') + $(python -c 'import os; print "{0:,.2f}".format(float(os.environ[""]))')))
  #MN_Total=$(python -c 'import os; print "{:.2f}".format((float(os.environ["MN_Total"]) + float(os.environ["tempVar"]))')
  MN_Total=$(python -c 'import os; print "{:.3f}".format((float(os.environ["MN_Total"]) + float(os.environ["tempVar"])))')
  #echo $MN_Total
  #Addr[$n]=$(curl -s -X GET $parm)

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
echo ""
echo "Total GUAP Holdings = $(python -c 'import os; print "{0:,.3f}".format(float(os.environ["MN_Total"]))')"
echo ""
echo "Total GUAP Money Supply = $(python -c 'import os; print "{0:,.5f}".format(float(os.environ["GUAPTotal"]))')"
echo ""
parm8="http://159.65.221.180:3001/ext/getmasternodecount"
MNCount=$(curl -s -X GET $parm8)
echo "Percentage of total GUAP Money Supply = $Perc%"
echo ""
echo "Total number of GUAP masternodes: $MNCount"
echo ""
set +a
