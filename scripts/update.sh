yum install wget -y

if [ -n "$( cat /etc/*-release | grep "CentOS" )" ]
then
    yum install epel-release -y
elif [ -n "$( cat /etc/*-release | grep "(Santiago)" )" ]
then
    wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
    yum localinstall epel-release-latest-6.noarch.rpm -y
else
    wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
    yum localinstall epel-release-latest-7.noarch.rpm -y
fi

yum install open-vm-tools curl rsyslog man man-pages bind-utils -y
yum upgrade -y
yum clean all