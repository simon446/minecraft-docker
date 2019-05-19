FROM openjdk:8u201-jre-alpine

LABEL maintainer "froadus"

# Expose ports
EXPOSE 25565/tcp
EXPOSE 25565/udp

# Set working directory
WORKDIR /data

# Download minecraft server file from provided url and rename to $JAR
RUN apt-get update && \
    apt-get -y install curl && \
    curl $URL --output $JAR

# Configure minecraft server
CMD java -Xmx$XMX -Xms$XMS -jar $JAR nogui
