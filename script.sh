#!/bin/bash
INTERVAL=30
COMUNITY=$1
IP=$2
MIB=$3

echo $COMUNITY $IP $MIB
OUT1=$(snmpget -v 1 -c $COMUNITY $IP IF-MIB::ifOutOctets.$MIB| awk '{print $4}')
IN1=$(snmpget -v 1 -c $COMUNITY $IP IF-MIB::ifInOctets.$MIB | awk '{print $4}')


sleep $INTERVAL

OUT2=$(snmpget -v 1 -c $COMUNITY $IP IF-MIB::ifOutOctets.$MIB| awk '{print $4}')
IN2=$(snmpget -v 1 -c $COMUNITY $IP IF-MIB::ifInOctets.$MIB | awk '{print $4}')


# Diminuindo
OUTM=$(($OUT2-$OUT1))
INM=$(($IN2-$IN1))

TOTALO=$((($OUTM * 8)/$INTERVAL))
TOTALI=$((($INM * 8)/$INTERVAL))

# Dumpe para algum arquivo !
echo $TOTALI $TOTALO 
