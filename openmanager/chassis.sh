#!/bin/bash

if [[ "$1" = "bios" ]];then
  /opt/dell/srvadmin/bin/omreport chassis bios -fmt ssv | grep Version | cut -d ";" -f 2  
  exit
fi

if [[ "$1" = "firmware" ]];then
  /opt/dell/srvadmin/bin/omreport chassis firmware -fmt ssv | grep DRAC | cut -d ";" -f 2
  exit
fi

if [[ "$1" = "hwperformance" ]];then
  /opt/dell/srvadmin/bin/omreport chassis hwperformance | grep "Status" | cut -d ":" -f 2 | grep -c "Normal"
  exit
fi

if [[ "$1" = "pwrmonitoring" ]];then
  /opt/dell/srvadmin/bin/omreport chassis pwrmonitoring | grep "Status" | cut -d ":" -f 2 | grep -c "Ok"
  exit
fi

if [[ "$1" = "Hardware-Log" ]];then
  /opt/dell/srvadmin/bin/omreport chassis -fmt ssv | grep "Hardware Log" | cut -d ";" -f 1 | grep -c "Ok"
  exit
fi

if [[ "$1" = "Power-Management" ]];then
  /opt/dell/srvadmin/bin/omreport chassis -fmt ssv | grep "Power Management" | cut -d ";" -f 1 | grep -c "Ok"
  exit
fi

if [[ "$1" = "Power-Supplies" ]];then
  /opt/dell/srvadmin/bin/omreport chassis -fmt ssv | grep "Power Supplies" | cut -d ";" -f 1 | grep -c "Ok"
  exit
fi

if [[ "$1" = "pwrusage" ]];then
  /opt/dell/srvadmin/bin/omreport chassis pwrmonitoring | grep Reading | head -1 | cut -d ":" -f 2 | tr -d " A-Z"
  exit
else
  /opt/dell/srvadmin/bin/omreport chassis -fmt ssv | grep "$1" | cut -d ";" -f 1 | grep -c "Ok"
  exit
fi
