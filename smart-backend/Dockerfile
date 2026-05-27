# 构建阶段
FROM maven:3.8-openjdk-8 AS builder
WORKDIR /build
COPY pom.xml .
RUN mvn dependency:go-offline -B
COPY src ./src
RUN mvn clean package -DskipTests -B

# 运行阶段
FROM eclipse-temurin:8-jre
WORKDIR /app
COPY --from=builder /build/target/smart-backend-0.0.1-SNAPSHOT.jar .
EXPOSE 8080
ENTRYPOINT ["java","-Xmx512m","-Xms256m","-jar","/app/smart-backend-0.0.1-SNAPSHOT.jar"]
