# Étape 1 : Construction
FROM gradle:8.3-jdk17 AS build
COPY . /app
WORKDIR /app
RUN gradle clean build -x test

# Étape 2 : Exécution
FROM openjdk:17-jdk-slim
COPY --from=build /app/build/libs/emplacement-service-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
