FROM maven:3.8.5-jdk-11

MAINTAINER Samuel Luis (https://github.com/samuel14luis)

COPY [".", "/usr/src/"]

WORKDIR /usr/src

RUN mvn clean install package

EXPOSE 8081

CMD ["mvn","--version"]