# Use Maven image with OpenJDK 17 as base image
FROM maven:latest AS build

# Set working directory
WORKDIR /workspace/app

# Copy pom.xml and checkstyle config
COPY pom.xml .
COPY checkstyle.xml .
RUN mvn dependency:go-offline -B

# Copy source code
COPY src src

# Build application
RUN mvn package -DskipTests
RUN mkdir -p target/dependency && (cd target/dependency; jar -xf ../*.jar)

# Production stage
FROM eclipse-temurin:17-jre

# Create non-root user for security
RUN groupadd -r spring && useradd -r -g spring spring

# Set working directory
WORKDIR /app

# Copy built application from build stage
ARG DEPENDENCY=/workspace/app/target/dependency
COPY --from=build ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY --from=build ${DEPENDENCY}/META-INF /app/META-INF
COPY --from=build ${DEPENDENCY}/BOOT-INF/classes /app

# Change ownership to spring user
RUN chown -R spring:spring /app
USER spring

# Expose port
EXPOSE 8080

# Run application
ENTRYPOINT ["java","-cp","/app:/app/lib/*","com.example.devopstraining.DevopsTrainingApplication"]
