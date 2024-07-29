FROM maven:3.8.4-openjdk-17 as builder
WORKDIR /app
COPY src ./src
COPY pom.xml .
RUN mvn clean package -DskipTests
RUN java -Djarmode=layertools -jar ./target/sa-demo-0.0.1-SNAPSHOT.jar extract

FROM openjdk:17
WORKDIR /app
COPY --from=builder app/dependencies/ ./
COPY --from=builder app/spring-boot-loader/ ./
COPY --from=builder app/snapshot-dependencies/ ./
COPY --from=builder app/application/ ./
ENTRYPOINT ["java", "org.springframework.boot.loader.launch.JarLauncher"]