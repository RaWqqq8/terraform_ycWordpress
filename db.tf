locals {
  dbuser     = tolist(yandex_mdb_postgresql_cluster.wp_postgresql.user.*.name)[0]
  dbpassword = tolist(yandex_mdb_postgresql_cluster.wp_postgresql.user.*.password)[0]
  dbhosts    = yandex_mdb_postgresql_cluster.wp_postgresql.host.*.fqdn
  dbname     = tolist(yandex_mdb_postgresql_cluster.wp_postgresql.database.*.name)[0]
}

resource "yandex_mdb_postgresql_cluster" "wp_postgresql" {
  name        = "wp-postgresql"
  folder_id   = var.yc_folder
  environment = "PRODUCTION"
  network_id  = yandex_vpc_network.wp-network.id

  config {
    version = 12
    resources {
      resource_preset_id = "s2.small"
      disk_type_id       = "network-ssd"
      disk_size          = 64
    }
  }

  database {
    name  = "db"
    owner = "user"
  }

  user {
    name     = "user"
    password = var.db_password
    permission {
      database_name = "db"
    }
  }

  host {
    zone             = "ru-central1-b"
    subnet_id        = yandex_vpc_subnet.wp-subnet-b.id
    assign_public_ip = true
  }

  host {
    zone             = "ru-central1-c"
    subnet_id        = yandex_vpc_subnet.wp-subnet-c.id
    assign_public_ip = true
  }
}
