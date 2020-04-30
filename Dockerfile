FROM centos:7
MAINTAINER NAME EMAIL
 
RUN yum makecache
RUN yum upgrade -y
RUN yum install -y httpd
EXPOSE 8080 8888
USER 1001
