#!/bin/bash

if [[ "$1" = "system" ]];then
  /opt/dell/srvadmin/bin/omreport system  -fmt ssv | grep "Main System Chassis" | cut -d ";" -f 1 |  grep -c "Ok"
  exit
fi

if [[ "$1" = "hardware" ]];then
  /opt/dell/srvadmin/bin/omreport system summary | grep 'Chassis Model' | awk -F ': ' '{ print $2}'
  exit
fi

if [[ "$1" = "tag" ]];then
  /opt/dell/srvadmin/bin/omreport system summary | grep 'Chassis Service Tag' | awk -F ': ' '{ print $2}'
  exit
fi
