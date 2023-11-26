FROM gradle:8.4.0-jdk11-alpine AS build
WORKDIR /app
COPY . .
RUN gradle build --no-daemon

FROM gradle:8.4.0-jdk11-alpine
COPY --from=build /app/build/libs/*.jar /app/
EXPOSE 8080
CMD ["java", "-jar", "/app/com.example.ktor-sample-all.jar"]