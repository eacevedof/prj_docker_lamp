FROM eclipse-temurin:25-jdk

RUN apt-get update && apt-get install -y \
    curl bash inotify-tools netcat-openbsd bash-completion vim \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN mkdir -p /app/uploads/logos /app/uploads/css

RUN mv /root/.bashrc /root/.bashrc.bak
COPY .bashrc /root/.bashrc

EXPOSE 8080
EXPOSE 35729

ENV JAVA_OPTS="-Xmx512m -Xms256m"
ENV SPRING_DEVTOOLS_RESTART_POLL_INTERVAL=2s
ENV SPRING_DEVTOOLS_RESTART_QUIET_PERIOD=1s

# mvnw, pom.xml, .mvn/, src/ y docker-entrypoint-dev.sh se montan como volúmenes
ENTRYPOINT ["bash", "-c", "sed 's/\\r$//' mvnw > /tmp/mvnw && cat /tmp/mvnw > mvnw && sed 's/\\r$//' docker-entrypoint-dev.sh > /tmp/ep.sh && cat /tmp/ep.sh > docker-entrypoint-dev.sh && chmod +x mvnw docker-entrypoint-dev.sh && ./mvnw dependency:go-offline -B -q && ./docker-entrypoint-dev.sh"]
