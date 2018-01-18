FROM centos:centos7
MAINTAINER Stephen K Conklin <stephen@thinkedg.com>



ENV container=docker
VOLUME /run /tmp


# update and clean
RUN yum update -y && \
    yum clean all


RUN yum -y install systemd; yum clean all; \
(cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

# install Packages
RUN yum install -y which && \
    yum install -y sudo  && \
    yum install -y rpm-build && \
    yum install -y emacs && \
    yum install -y tree && \
    yum install -y wget && \
    yum install -y openssl && \
    yum groupinstall -y 'Development Tools' && \
    yum clean all

RUN echo 'check_certificate = off' > /root/.wgetrc

CMD /usr/sbin/init


