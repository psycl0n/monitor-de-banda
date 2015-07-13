#!/bin/bash
INTERVAL=30


OUT1=$(snmpget -v 1 -c public 192.168.129.202 IF-MIB::ifOutOctets.11| awk '{print $4}')
IN1=$(snmpget -v 1 -c public 192.168.129.202 IF-MIB::ifInOctets.11 | awk '{print $4}')

sleep $INTERVAL

OUT2=$(snmpget -v 1 -c public 192.168.129.202 IF-MIB::ifOutOctets.11| awk '{print $4}')
IN2=$(snmpget -v 1 -c public 192.168.129.202 IF-MIB::ifInOctets.11 | awk '{print $4}')

# Diminuindo
OUTM=$(($OUT2-$OUT1))
INM=$(($IN2-$IN1))

TOTALO=$((($OUTM * 8)/$INTERVAL))
TOTALI=$((($INM * 8)/$INTERVAL))

echo $TOTALI $TOTALO >> logs.txt
