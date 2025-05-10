resource "google_sql_database_instance" "database" {
  name             = "${var.instance_name}-db"
  database_version = var.database_version
  region           = var.region

  settings {
    tier = var.machine_type

    ip_configuration {
      ipv4_enabled = true
      authorized_networks {
        name  = "app-network"
        value = var.app_network
      }
    }
  }

  deletion_protection = false
}

resource "google_sql_database" "database" {
  name     = var.db_name
  instance = google_sql_database_instance.database.name
}

resource "google_sql_user" "user" {
  name     = var.username
  instance = google_sql_database_instance.database.name
  password = var.password
} 