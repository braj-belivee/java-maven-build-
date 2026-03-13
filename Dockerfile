FROM openjdk
EXPOSE 8080
WORKDIR  /usr/app 
COPY ./target/java-maven-app-*.jar /usr/app
CMD [ "java", "-jar", "java-maven-app-*.jar"]
