# Etapa de construcción
FROM eclipse-temurin:17-jdk-jammy AS build

WORKDIR /app

COPY pom.xml .
COPY mvnw .
COPY .mvn .mvn

RUN ./mvnw dependency:go-offline

COPY src src
RUN ./mvnw clean package -DskipTests

# Etapa de ejecución (más liviana)
FROM eclipse-temurin:17-jre-jammy

WORKDIR /app

# Copiar solo el jar generado desde la etapa de build
COPY --from=build /app/target/categories-0.0.1-SNAPSHOT.jar app.jar

# Variables de entorno (se pueden sobrescribir)
ENV DB_HOST=test-db \
    DB_PORT=3306 \
    DB_DATABASE=test \
    DB_USER=root \
    DB_PASSWORD=admin123

# Puerto (si usas Spring Boot, define server.port)
EXPOSE 8080

# Ejecuta el jar
ENTRYPOINT ["java", "-jar", "app.jar"]
