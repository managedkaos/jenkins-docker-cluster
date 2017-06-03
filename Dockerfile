FROM centos:centos7
MAINTAINER Managed Kaos <info@managedkaos.com>

RUN yum -y update && \
    yum clean all && \
    yum -y install \
        chpasswd \
        java-1.8.0-openjdk \
        java-1.8.0-openjdk-devel \
        openssh-server && \
    yum clean all && \
    useradd -d /var/lib/jenkins jenkins && \
    echo 'jenkins:jenkins' | chpasswd && \
    mkdir /var/run/sshd && \
    ssh-keygen -b 1024 -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' && \
    ln -s /etc/ssh/ssh_host_rsa_key /etc/ssh/ssh_host_ecdsa_key && \
    ln -s /etc/ssh/ssh_host_rsa_key /etc/ssh/ssh_host_ed25519_key 

ENTRYPOINT ["/usr/sbin/sshd", "-D"]
