FROM centos:7
MAINTAINER rleme@br.ibm.com
LABEL APP="PHP"

ENV PORT 8080
RUN yum -y install php && \
    yum -y install httpd && \
    yum -y clean all 
RUN echo "ServerName 127.0.0.1" >>/etc/httpd/conf/httpd.conf
COPY ./src/  /var/www/html/
USER apache
EXPOSE ${PORT}
CMD ["httpd","-D", "start"]
