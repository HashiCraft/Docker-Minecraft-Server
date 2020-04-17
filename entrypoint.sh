#!/bin/sh -e

# Add the default mods and world
if [ "${WORLD_BACKUP}" != "" ]; then
  if [ ! "$(ls -A /minecraft/world)" ]; then 
    echo "Installing default world ${WORLD_BACKUP}"
    cd /tmp && \
      wget -O world.tar.gz ${WORLD_BACKUP} && \
      tar -xzf world.tar.gz && \
      mv ./world/* /minecraft/world/ && \
      rm world.tar.gz
  fi
fi

if [ "${MODS_BACKUP}" != "" ]; then 
  if [ ! "$(ls -A /minecraft/mods)" ]; then 
    if [ ! -d "/minecraft/mods" ]; then
      mkdir /minecraft/mods
    fi

    echo "Installing default mods ${MODS_BACKUP}"
    cd /tmp && \
      wget -O mods.tar.gz ${MODS_BACKUP} && \
      tar -xzf mods.tar.gz && \
      mv ./mods/* /minecraft/mods/ && \
      rm mods.tar.gz
  fi
fi

# Add config items which are in the main minecraft folder from config so that 
# they can persist across launches
if [ ! -d "/minecraft/config" ]; then
  mkdir /minecraft/config
fi

if [ ! -f "/minecraft/config/banned-ips.json" ]; then
  echo "[]" >> /minecraft/config/banned-ips.json
fi

if [ ! -f "/minecraft/config/banned-players.json" ]; then
  echo "[]" >> /minecraft/config/banned-players.json
fi

if [ ! -f "/minecraft/config/usercache.json" ]; then
  echo "[]" >> /minecraft/config/usercache.json
fi

if [ ! -f "/minecraft/config/whitelist.json" ]; then
  echo "[]" >> /minecraft/config/whitelist.json
fi

ln -s /minecraft/config/banned-ips.json /minecraft/banned-ips.json
ln -s /minecraft/config/banned-players.json /minecraft/banned-players.json
ln -s /minecraft/config/usercache.json /minecraft/usercache.json
ln -s /minecraft/config/whitelist.json /minecraft/whitelist.json

# Configure the properties
# Echo the file as it has embedded environment variables
eval "echo \"$(cat /server.properties)\"" > /minecraft/server.properties

# Start the server
cd /minecraft
java -Xmx${JAVA_MEMORY} -Xms${JAVA_MEMORY} -jar forge-1.12.2-14.23.5.2768-universal.jar nogui