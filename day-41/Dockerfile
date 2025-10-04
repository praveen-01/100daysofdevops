FROM ubuntu:24.04

RUN apt-get -y update

RUN apt-get install -y apache2

RUN sed -i "s/80/5004/g" /etc/apache2/ports.conf

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND", "-k", "start"]