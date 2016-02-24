#!/bin/bash

if [[ "$1" = "pdisk-controller=0" ]];then
  /opt/dell/srvadmin/bin/omreport storage pdisk controller=0 | grep Status | cut -d ":" -f 2 | grep -c Ok
  exit
fi

if [[ "$1" = "connector-controller=0" ]];then
  /opt/dell/srvadmin/bin/omreport storage connector controller=0 | grep Status | cut -d ":" -f 2 | grep -c Ok
  exit
fi

if [[ "$1" = "pdisk-state" ]];then
  /opt/dell/srvadmin/bin/omreport storage pdisk controller=0 | grep "^State" | grep -v -e ": Online" -e ": Ready"  | wc -l
  exit
fi

if [[ "$1" = "pdisk-status" ]];then
  /opt/dell/srvadmin/bin/omreport storage pdisk controller=0 | grep "^Status" | grep -v ": Ok"  | wc -l
  exit
fi

if [[ "$1" = "vdisk" ]];then
  /opt/dell/srvadmin/bin/omreport storage $1 | grep Status | cut -d ":" -f 2 | grep -c Ok
  exit
fi

if [[ "$1" = "enclosure" ]];then
  /opt/dell/srvadmin/bin/omreport storage $1 | grep Status | cut -d ":" -f 2 | grep -c Ok
  exit
fi

if [[ "$1" = "battery" ]];then
  /opt/dell/srvadmin/bin/omreport storage battery | grep -e Status -e State | cut -d ":" -f 2 | grep -c -e Ok -e Charging
  exit
fi

if [[ "$1" = "controller" ]];then
  /opt/dell/srvadmin/bin/omreport storage controller | grep Status | cut -d ":" -f 2 | grep -c -e Ok -e "Non-Critical"
  exit
fi
