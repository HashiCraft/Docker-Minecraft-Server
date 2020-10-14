container "minecraft" {
  image {
    name = "hashicraft/minecraft:v1.16.3"
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
    key = "WHITELIST_ENABLE"
    value = "false"
  }
  
  env {
    key = "RCON_PASSWORD"
    value = "password"
  }
  
  env {
    key = "RCON_ENABLED"
    value = "true"
  }

  # Install default Mods and World
  env {
    key = "WORLD_BACKUP"
    value = "https://github.com/HashiCraft/digital-ocean-tide/releases/download/v0.0.0/world.tar.gz"
  }
}