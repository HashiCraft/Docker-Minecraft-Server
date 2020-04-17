container "minecraft" {
  image {
    name = "nicholasjackson/minecraft:v1.12.2"
  }

  volume {
    source = "./mc_server/mods"
    destination = "/minecraft/mods"
  }
  
  volume {
    source = "./mc_server/world"
    destination = "/minecraft/world"
  }
  
  volume {
    source = "./mc_server/config"
    destination = "/minecraft/config"
  }

  port {
    local = 25565
    remote = 25565
    host = 25565
  }

  env {
    key = "MINECRAFT_MOTD"
    value = "HashiCraft"
  }
  
  env {
    key = "MINECRAFT_RCON_PASSWORD"
    value = "password"
  }
  
  env {
    key = "MINECRAFT_RCON_ENABLED"
    value = "true"
  }

  # Install default Mods and World
  env {
    key = "WORLD_BACKUP"
    value = "https://github.com/hashicraft/mc/releases/download/v0.0.1/world.tar.gz"
  }
  
  env {
    key = "MODS_BACKUP"
    value = "https://github.com/hashicraft/mc/releases/download/v0.0.1/mods.tar.gz"
  }
}