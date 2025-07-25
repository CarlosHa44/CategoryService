FROM eclipse-temurin:17-jdk-jammy

WORKDIR /app

COPY pom.xml .
COPY mvnw .
COPY .mvn .mvn

# Descarga las dependencias
RUN ./mvnw dependency:go-offline

# Copia el código fuente
COPY src src

# Empaqueta la aplicación
RUN ./mvnw clean package -DskipTests

# Puerto que expone la aplicación (debe coincidir con server.port en application.properties)
EXPOSE $PORT

# Variables de entorno para la conexión a MySQL (pueden ser sobrescritas al ejecutar el contenedor)
ENV DB_HOST=test-db
ENV DB_PORT=3306
ENV DB_DATABASE=test
ENV DB_USER=root
ENV DB_PASSWORD=admin123

# Comando para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "target/categories-0.0.1-SNAPSHOT.jar"]