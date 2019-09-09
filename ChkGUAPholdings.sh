#!/bin/bash


clear

echo "testA2 testB2 testC2"

#curl -s http://159.65.221.180:3001/ext/getbalance/GK6Vdaq4Gp7G5aUSPiMFb6gKpk3Sq5xeCs 2> /dev/null
MN1="testMN1"
MN1= $(curl -s 'http://159.65.221.180:3001/ext/getbalance/GK6Vdaq4Gp7G5aUSPiMFb6gKpk3Sq5xeCs')

echo "MN1 Total= $MN1"
#MN2= $(curl http://159.65.221.180:3001/ext/getbalance/GPRN7jMA9DAKPaSThT9TpH3EsHfgG2zSg6 2> /dev/null)

#echo ""
#echo "MN2 Total= $MN2"

#MN3= $(curl http://159.65.221.180:3001/ext/getbalance/GadrCsoWB1YoGKiAofte1c8iyNaZpn7DHR 2> /dev/null)

#echo ""
#echo "MN3 Total= $MN3"

#MN4= $(curl http://159.65.221.180:3001/ext/getbalance/GVmzuuU8M2epADTHAFTcJfKKeVAT4odyZh 2> /dev/null)

#echo ""
#echo "MN4 Total= $MN4"

#MN5=  $(curl http://159.65.221.180:3001/ext/getbalance/GTsz49S1dgbMcC82wcekku6kyHwNU97yYa 2> /dev/null)

#echo ""
#echo "MN5 Total= $MN5"

#MN6= $(curl http://159.65.221.180:3001/ext/getbalance/GNENXQeidRkFxfjjoRcNiLpfSRMvs5eY6d 2> /dev/null)

#echo ""
#echo "MN6 Total= $MN6"

#echo ""
#echo "______________________________________________"

#MNTotal= $MN1 + $MN2 + $MN3 + $MN4 + $MN5 + $MN6

#echo "Total GUAP Holdings for all MNs: $MNTotal"
