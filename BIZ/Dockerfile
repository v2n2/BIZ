# Start with a base image containing Java runtime
FROM tomcat:8

# Add Author info
LABEL maintainer="hyunbin.lim@kt.com"

# Add a volume to /tmp
VOLUME /tmp

# Make port 8080 available to the world outside this container
EXPOSE 8080

# The application's jar file
ARG JAR_FILE=target/biz-0.0.1-SNAPSHOT.war

# Add the application's jar to the container
ADD ${JAR_FILE} crm.war

# Run the jar file
ENTRYPOINT ["java","-jar","crm.war"]

