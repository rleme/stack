FROM centos:7
MANTAINER rleme@br.ibm.com
LABEL APP="PHP"

ENV PORT 8080
RUN yum -y install php && \
    yum -y install httpd && \
    yum -y clean data

COPY ./php/index.php  /var/www/html/
USER apache
EXPOSE ${PORT}
CMD ["httpd","-D", "start"]
