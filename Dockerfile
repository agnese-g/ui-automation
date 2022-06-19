FROM maven:3.8.1-openjdk-11
# FROM maven:3.6.0-jdk-8
# FROM maven:3.8.1-jdk-11

LABEL "AUTHOR"="Agnese Gurecka" "COMPANY"="TestDevLab"

RUN mkdir docker
WORKDIR /usr/src/docker
COPY pom.xml ./
COPY testNG.xml ./
COPY send_notification.sh ./
COPY src src

# COPY pom.xml /tmp/pom.xml
# RUN mvn -B -f /tmp/pom.xml -s /usr/share/maven/ref/settings-docker.xml dependency:resolve
RUN mvn -B -f /usr/src/docker/pom.xml -s /usr/share/maven/ref/settings-docker.xml dependency:resolve
RUN mvn dependency:resolve
RUN mvn clean install -DskipTests
# RUN mvn clean test -Dbrowser=chrome
