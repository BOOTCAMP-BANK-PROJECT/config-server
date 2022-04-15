# Build the project jar files
FROM maven:3.8.5-jdk-11 as builder

MAINTAINER Samuel Luis (https://github.com/samuel14luis)

COPY [".", "/usr/src/"]

WORKDIR /usr/src

RUN mvn clean install package

CMD ["mvn","--version"]



# Productive image
FROM openjdk:11-jdk

WORKDIR /usr/src

COPY --from=builder ["/usr/src/target/config-server-0.0.1-SNAPSHOT.jar", "/usr/src/"]

EXPOSE 8081

CMD ["java","--version"]