FROM centos

RUN yum -y install httpd php && yum clean all
ADD html/ /var/www/html
EXPOSE 80
ENTRYPOINT [ "/usr/sbin/httpd", "-D", "FOREGROUND" ]
