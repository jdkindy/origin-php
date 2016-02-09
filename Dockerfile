FROM centos

RUN yum -y install httpd php && yum clean all
ADD html/ /var/www/html
RUN setcap 'cap_net_bind_service=+ep' /usr/sbin/httpd
RUN setcap 'cap_net_bind_service=+ep' /usr/sbin/apachectl
RUN setcap 'cap_net_bind_service=+ep' /run-apache.sh
EXPOSE 80

ADD run-apache.sh /run-apache.sh
RUN chmod -v +x /run-apache.sh

CMD ["/run-apache.sh"]
