FROM ubuntu:16.04
MAINTAINER Thomas Steinbach (@aikq.de)

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y openssh-server && \
    apt-get clean

RUN mkdir /var/run/sshd && \
    chmod 0755 /var/run/sshd

ADD files/ssh/sshd_config /etc/ssh/sshd_config
RUN chmod 0644 /etc/ssh/sshd_config

RUN adduser --disabled-password --home /mount --gecos '' ftp && \
    mkdir -p /mount/data && \
    chown -R ftp:ftp /mount && \
    chown root:ftp /mount && \
    chmod 750 /mount

ADD files/system/start.sh /root/start.sh
RUN chmod 0755 /root/start.sh

VOLUME ["/mount/.ssh"]

EXPOSE 22

ENTRYPOINT ["/root/start.sh"]
