FROM maven:3-jdk-8-alpine as builder

WORKDIR /build
RUN apk update && apk add git && git clone https://github.com/kkenan/basic-microservices.git
WORKDIR /build/basic-microservices/spring-boot-app
RUN mvn clean package


FROM openjdk:8-jre-alpine as spring-app
WORKDIR /app
COPY --from=builder /build/basic-microservices/spring-boot-app/target/spring-boot-app-1.0-SNAPSHOT.jar ./ 
COPY ./spring-boot-config.yml .
EXPOSE 8080

ENTRYPOINT [ "java", "-jar", "spring-boot-app-1.0-SNAPSHOT.jar", "--spring.config.location=spring-boot-config.yml" ]


FROM node:9.9-alpine as node-app
WORKDIR /app
COPY --from=builder /build/basic-microservices/node-app ./
RUN npm install express
EXPOSE 8081

CMD [ "node", "index.js" ]