#!/bin/bash

echo ""
echo ""
echo $(date)
echo ""

set -a

parm1="http://159.65.221.180:3001/ext/getbalance/GK6Vdaq4Gp7G5aUSPiMFb6gKpk3Sq5xeCs"
MN1=$(curl -s -X GET $parm1)

echo "MN1 Total= $(python -c 'import os; print "{0:,.2f}".format(float(os.environ["MN1"]))')"

parm2="http://159.65.221.180:3001/ext/getbalance/GPRN7jMA9DAKPaSThT9TpH3EsHfgG2zSg6"
MN2=$(curl -s -X GET $parm2)
echo ""
echo "MN2 Total= $(python -c 'import os; print "{0:,.2f}".format(float(os.environ["MN2"]))')"

parm3="http://159.65.221.180:3001/ext/getbalance/GadrCsoWB1YoGKiAofte1c8iyNaZpn7DHR"
MN3=$(curl -s -X GET $parm3)
echo ""
echo "MN3 Total= $(python -c 'import os; print "{0:,.2f}".format(float(os.environ["MN3"]))')"

parm4="http://159.65.221.180:3001/ext/getbalance/GVmzuuU8M2epADTHAFTcJfKKeVAT4odyZh"
MN4=$(curl -s -X GET $parm4)
echo ""
echo "MN4 Total= $(python -c 'import os; print "{0:,.2f}".format(float(os.environ["MN4"]))')"


parm5="http://159.65.221.180:3001/ext/getbalance/GTsz49S1dgbMcC82wcekku6kyHwNU97yYa"
MN5=$(curl -s -X GET $parm5)
echo ""
echo "MN5 Total= $(python -c 'import os; print "{0:,.2f}".format(float(os.environ["MN5"]))')"


parm6="http://159.65.221.180:3001/ext/getbalance/GNENXQeidRkFxfjjoRcNiLpfSRMvs5eY6d"
MN6=$(curl -s -X GET $parm6)
echo ""
echo "MN6 Total= $(python -c 'import os; print "{0:,.2f}".format(float(os.environ["MN6"]))')"

echo "________________________"

#get change
parm6b="http://159.65.221.180:3001/ext/getbalance/GTopckRJ7f4a1VSVd2fZRTW7KGUt8JBccb"
Change=$(curl -s -X GET $parm6b)

MNTotal=$(( $MN1 + 0 + $MN2 + $MN3 + $MN4 + $MN5 + $MN6 ))
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
