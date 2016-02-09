FROM centos

RUN yum -y install httpd php && yum clean all
ADD html/ /var/www/html
RUN setcap 'cap_net_bind_service=+ep' /usr/sbin/httpd
EXPOSE 80
ENTRYPOINT [ "/usr/sbin/httpd", "-D", "FOREGROUND" ]
