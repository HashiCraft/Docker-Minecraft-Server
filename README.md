---
  title: HashiCraft Minecraft server
---

# HashiCraft Minecraft Server

![](./images/hashicraft_logo.png)

## Running
Install Shipyard [https://shipyard.run](https://shipyard.run)

```
➜ shipyard run
Running configuration from:  ./

2020-04-09T09:12:28.504+0100 [DEBUG] Statefile does not exist
2020-04-09T09:12:28.504+0100 [INFO]  Creating Container: ref=minecraft
2020-04-09T09:12:28.562+0100 [DEBUG] Image exists in local cache: image=nicholasjackson/minecraft:latest
2020-04-09T09:12:28.562+0100 [INFO]  Creating Container: ref=minecraft
```

On initialization the Docker container will download the world and mods and copy these to your local disk:

* ./mc_server/mods == Mine craft mods
* ./mc_server/world == Mine craft world

If you would like to go back to a  default world then remove the contents of `./mc_server/world`

## Mods
* Minecraft Chromium Embedded
* Web Displays
* Voice Chat (also requires Client install, https://github.com/hashicraft/mc/releases/download/v0.0.1/mods.zip)

## Logs

```
➜ docker logs -f minecraft.container.shipyard.run
Installing default world
Installing default mods
2020-04-09 08:14:16,220 main WARN Disabling terminal, you're running in an unsupported environment.
[08:14:16] [main/INFO] [LaunchWrapper]: Loading tweak class name net.minecraftforge.fml.common.launcher.FMLServerTweaker
```

## RCom server Admin
The server can be administered with RCom, to run the RCom CLI use the following command

```
shipyard exec container.minecraft -- rcon-cli --password=password
> /help
```

## Building Docker
To make changes to the docker image you can modify the Dockerfile and entrypoint.sh script then build a new container

```
docker build -t hashicraft/minecraft:latest
```

## Exposing your server to the outside world
Install ngrok

```
ngrok tcp 2556
```