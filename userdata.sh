#!/bin/bash -xe

yum update -y
yum install -y -e0 pcs pacemaker
echo "${password}" | passwd --stdin hacluster
service pcsd start
chkconfig pcsd on
