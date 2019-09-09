#!/bin/bash


clear

echo "testA8"

#MN1= $(curl -s http://159.65.221.180:3001/ext/getbalance/GK6Vdaq4Gp7G5aUSPiMFb6gKpk3Sq5xeCs)
parm1="http://159.65.221.180:3001/ext/getbalance/GK6Vdaq4Gp7G5aUSPiMFb6gKpk3Sq5xeCs"
MN1=$(curl -s -X GET $parm1)
#echo -ne "test: $(su -c "curl -s -X $parm" "root")\\r"

echo "MN1 Total= $MN1"
#MN2= $(curl http://159.65.221.180:3001/ext/getbalance/GPRN7jMA9DAKPaSThT9TpH3EsHfgG2zSg6 2> /dev/null)

parm2="http://159.65.221.180:3001/ext/getbalance/GPRN7jMA9DAKPaSThT9TpH3EsHfgG2zSg6"
MN2=$(curl -s -X GET $parm2)
echo ""
echo "MN2 Total= $MN2"

#MN3= $(curl http://159.65.221.180:3001/ext/getbalance/GadrCsoWB1YoGKiAofte1c8iyNaZpn7DHR 2> /dev/null)
parm3="http://159.65.221.180:3001/ext/getbalance/GadrCsoWB1YoGKiAofte1c8iyNaZpn7DHR"
MN3=$(curl -s -X GET $parm3)
echo ""
echo "MN3 Total= $MN3"


#MN4= $(curl http://159.65.221.180:3001/ext/getbalance/GVmzuuU8M2epADTHAFTcJfKKeVAT4odyZh 2> /dev/null)
parm4="http://159.65.221.180:3001/ext/getbalance/GVmzuuU8M2epADTHAFTcJfKKeVAT4odyZh"
MN4=$(curl -s -X GET $parm4)
echo ""
echo "MN4 Total= $MN4"


#MN5=  $(curl http://159.65.221.180:3001/ext/getbalance/GTsz49S1dgbMcC82wcekku6kyHwNU97yYa 2> /dev/null)
parm5="http://159.65.221.180:3001/ext/getbalance/GTsz49S1dgbMcC82wcekku6kyHwNU97yYa"
MN5=$(curl -s -X GET $parm5)
echo ""
echo "MN5 Total= $MN5"


#MN6= $(curl http://159.65.221.180:3001/ext/getbalance/GNENXQeidRkFxfjjoRcNiLpfSRMvs5eY6d 2> /dev/null)
parm6="http://159.65.221.180:3001/ext/getbalance/GNENXQeidRkFxfjjoRcNiLpfSRMvs5eY6d"
MN6=$(curl -s -X GET $parm6)
echo ""
echo "MN6 Total= $MN6"

echo "__________________"
MNTotal=""
MNTotal12= $(($MNTotal12+$MN1))

echo "Total GUAP Holdings for all MNs: $MNTotal"
