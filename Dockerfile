# compilation fails on back4app platform with out of memory exception
#FROM gradle:8.4.0-jdk11-alpine AS build
#WORKDIR /app
#COPY . .
#RUN gradle build --no-daemon

FROM gradle:8.4.0-jdk11-alpine
#COPY --from=build /app/build/libs/*.jar /app/
COPY build/libs/com.example.ktor-sample-all.jar /app/
EXPOSE 8080
CMD ["java", "-jar", "/app/com.example.ktor-sample-all.jar"]