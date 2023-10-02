# Use an official Tomcat runtime as a parent image
FROM tomcat:latest

# Set environment variables for Java
#ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
#ENV PATH $JAVA_HOME/bin:$PATH

# Install OpenJDK 8
RUN apt-get update && apt-get install -y openjdk-8-jdk

# Create a directory to store WAR files
RUN mkdir /usr/local/tomcat/webapps/app

# Copy your WAR file(s) from the server to the container
ADD **/*.war /usr/local/tomcat/webapps

# Expose the Tomcat port
EXPOSE 8081

# Start Tomcat when the container launches
CMD ["catalina.sh", "run"]
