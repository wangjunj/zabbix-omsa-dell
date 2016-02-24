server:DELL PowerEdge R630   
os:centos7.2 64bit   

Install OMSA   
1.wget -q -O - http://linux.dell.com/repo/hardware/latest/bootstrap.cgi | bash   
2.yum update   
3.yum install srvadmin-all   

Add template   
1.cp omreport.conf /etc/zabbix/zabbix_agentd.d/   
2.cp -r openmanager /etc/zabbix/   
3.chmod +x /etc/zabbix/openmanager/*.sh   
4.systemctr restart zabbix-agent (OR reboot)   
5.zabbix:Configuration--Templates--Import,zbx_export_DELL_OMSA_templates.xml   

Have fun!thinks for github people!
