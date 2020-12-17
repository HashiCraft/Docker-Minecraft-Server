FROM openjdk:8

WORKDIR /minecraft

RUN apt-get update && apt-get install -y wget libfreetype6

# Install rcon
RUN wget https://github.com/itzg/rcon-cli/releases/download/1.4.8/rcon-cli_1.4.8_linux_amd64.tar.gz && \
  tar -xzf rcon-cli_1.4.8_linux_amd64.tar.gz && \
  rm rcon-cli_1.4.8_linux_amd64.tar.gz && \
  mv rcon-cli /usr/local/bin

# Setup the server
RUN wget https://github.com/HashiCraft/Docker-Minecraft-Server/releases/download/forge/forge-1.16.4-35.1.0-installer.jar  && \
  java -jar forge-1.16.4-35.1.0-installer.jar --installServer

# Copy the signed eula
COPY ./eula.txt eula.txt

# Add the entrypoint
COPY ./entrypoint.sh /minecraft/entrypoint.sh
COPY ./server.properties /server.properties

# Set defaults for environment variables
ENV MINECRAFT_PORT 25565
ENV RCON_PORT 27015
ENV JAVA_MEMORY 1G
ENV RCON_ENABLED false
ENV WHITELIST_ENABLED true
ENV ALLOW_NETHER false
ENV GAME_MODE creative
ENV ENABLE_QUERY false
ENV PLAYER_IDLE_TIMEOUT 0
ENV DIFFICULTY easy
ENV SPAWN_MONSTERS false
ENV SPAWN_ANIMALS false
ENV SPAWN_NPCS false
ENV ONLINE_MODE true 

ENTRYPOINT [ "/minecraft/entrypoint.sh" ]
