FROM centos:centos7
MAINTAINER Managed Kaos <info@managedkaos.com>

RUN yum -y update && \
    yum clean all && \
    yum -y install openssh-server chpasswd wget && \
    yum clean all && \
    useradd -d /var/lib/jenkins jenkins && \
    echo 'jenkins:jenkins' | chpasswd && \
    mkdir /var/run/sshd && \
    ssh-keygen -b 1024 -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' && \
    ln -s /etc/ssh/ssh_host_rsa_key /etc/ssh/ssh_host_ecdsa_key && \
    ln -s /etc/ssh/ssh_host_rsa_key /etc/ssh/ssh_host_ed25519_key && \
    wget --quiet --directory-prefix=/tmp --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm" && \
    yum localinstall -y /tmp/jdk-8u131-linux-x64.rpm

ENTRYPOINT ["/usr/sbin/sshd", "-D"]
