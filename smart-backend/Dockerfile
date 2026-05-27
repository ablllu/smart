# 基础镜像
FROM eclipse-temurin:8-jre

# 指定工作目录
WORKDIR /app

# 将 jar 包添加到工作目录，比如 target/yuoj-backend-user-service-0.0.1-SNAPSHOT.jar
ADD target/smart-backend-0.0.1-SNAPSHOT.jar .

# 暴露端口
EXPOSE 8080

# 启动命令
#ENTRYPOINT ["java","-jar","/app/smart-backend-0.0.1-SNAPSHOT.jar","--spring.profiles.active=prod"] 激活生产环境
ENTRYPOINT ["java","-Xmx512m","-Xms256m","-jar","/app/smart-backend-0.0.1-SNAPSHOT.jar"]
