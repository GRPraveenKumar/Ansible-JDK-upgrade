# Base image
FROM centos

# Update packages
RUN yum update -y 

# Set environment variables
ENV JAVA_HOME /opt/jdk8
ENV PATH $PATH:$JAVA_HOME/bin
ENV CATALINA_HOME /opt/tomcat

# Install JDK 8 
# Change dir to /opt
RUN cd /opt
# install wget 
RUN yum install wget -y
RUN wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm 
# install java from package
RUN yum install jdk-8u131-linux-x64.rpm -y

# Install Tomcat from source
RUN yum install wget unzip -y
RUN cd /opt
RUN wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.44/bin/apache-tomcat-9.0.44.zip
RUN unzip apache-tomcat-9.0.44.zip 
RUN chmod u+x /opt/apache-tomcat-9.0.44/bin/*.sh    
# Expose Tomcat ports
EXPOSE 8080

# Start Tomcat on container startup
CMD $CATALINA_HOME/bin/catalina.sh run
