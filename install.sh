# /bin/bash
#

## ref:: https://mirrors.tuna.tsinghua.edu.cn/help/raspbian/
## source:
#deb http://deb.debian.org/debian bullseye main contrib non-free
#deb http://security.debian.org/debian-security bullseye-security main contrib non-free
#deb http://deb.debian.org/debian bullseye-updates main contrib non-free
# Uncomment deb-src lines below then 'apt-get update' to enable 'apt-get source'
#deb-src http://deb.debian.org/debian bullseye main contrib non-free
#deb-src http://security.debian.org/debian-security bullseye-security main contrib non-free
#deb-src http://deb.debian.org/debian bullseye-updates main contrib non-free

cp /etc/apt/sources.list /tmp/sources.list.backup
sed -e 's/http:\/\/deb.debian.org/https:\/\/mirrors.tuna.tsinghua.edu.cn/;
        s/http:\/\/security.debian.org/https:\/\/mirrors.tuna.tsinghua.edu.cn/' \
        /tmp/sources.list.backup > /etc/apt/sources.list
#deb http://archive.raspberrypi.org/debian/ bullseye main
# Uncomment line below then 'apt-get update' to enable 'apt-get source'
# #deb-src http://archive.raspberrypi.org/debian/ bullseye main

cp /etc/apt/sources.list.d/raspi.list /tmp/raspi.list.backup
sed -e 's/http:\/\/archive.raspberrypi.org\/debian/https:\/\/mirrors.tuna.tsinghua.edu.cn\/raspberrypi/' \
        /tmp/raspi.list.backup > /etc/apt/sources.list.d/raspi.list

apt-get update --fix-missing
apt-get upgrade -y
apt-get install -y vim

## Docker install
curl -fsSL get.docker.com -o /tmp/get-docker.sh
sh /tmp/get-docker.sh --mirror Aliyun

systemctl enable docker
systemctl start docker

groupadd docker
usermod -aG docker $USER
