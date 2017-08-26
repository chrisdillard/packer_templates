if [ -n "$( cat /etc/*-release | grep "CentOS" )" ]
then
    yum --enablerepo=extras install epel-release -y
fi

yum install open-vm-tools wget curl rsyslog man man-pages -y
yum upgrade -y
yum clean all