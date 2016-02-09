FROM centos

RUN yum -y install httpd php && yum clean all
ADD html/ /var/www/html
EXPOSE 8080
ENTRYPOINT [ "/usr/sbin/httpd", "-D", "FOREGROUND" ]
