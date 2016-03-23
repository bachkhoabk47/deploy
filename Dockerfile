# OpenCPS
# Verion 0.0.1

FROM centos:7
MAINTAINER Nguyen Van Tan <tan.nv@netnam.vn>

RUN yum update -y
RUN yum install wget -y
RUN yum install unzip -y

# Install Java 8
RUN wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u25-b17/jre-8u25-linux-x64.tar.gz"
RUN tar -zxvf  jre-8u25-linux-x64.tar.gz
RUN alternatives --install /usr/bin/java java /jre1.8.0_25/bin/java 1

# Download and unzip source code for liferay
RUN wget https://sourceforge.net/projects/lportal/files/Liferay%20Portal/6.2.5%20GA6/liferay-portal-tomcat-6.2-ce-ga6-20160112152609836.zip
RUN unzip liferay-portal-tomcat-6.2-ce-ga6-20160112152609836.zip -d /opt

# Ports
EXPOSE 8090

# EXEC
CMD ["bash"]
CMD ["run"]
ENTRYPOINT ["/opt/liferay-portal-6.2-ce-ga6/tomcat-7.0.62/bin/catalina.sh"]
