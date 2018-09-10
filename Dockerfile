# DOCKER-VERSION 1.2.0
FROM centos:centos6

#Install WGET
RUN yum install -y wget

#Install tar
RUN yum install -y tar

# Download JDK
RUN cd /opt;wget https://s3.amazonaws.com//jdk-7u67-linux-x64.tar.gz

#gunzip JDK
RUN cd /opt;gunzip jdk-7u67-linux-x64.tar.gz
RUN cd /opt;tar xvf jdk-7u67-linux-x64.tar
RUN alternatives –install /usr/bin/java java /opt/jdk1.7.0_67/bin/java 2

# Download Apache Tomcat 7
RUN cd /tmp;wget https://s3.amazonaws.com//apache-tomcat-7.0.55.tar.gz

# untar and move to proper location
RUN cd /tmp;gunzip apache-tomcat-7.0.55.tar.gz
RUN cd /tmp;tar xvf apache-tomcat-7.0.55.tar
RUN cd /tmp;mv apache-tomcat-7.0.55 /opt/tomcat7
RUN chmod -R 755 /opt/tomcat7

ENV JAVA_HOME /opt/jdk1.7.0_67

EXPOSE 8080

CMD /opt/tomcat7/bin/catalina.sh run
