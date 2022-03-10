# Database mysql
resource "google_sql_database" "database" {
  name     = "localize-database"
  project  = var.project
  instance = google_sql_database_instance.mysql.name
}

# Database base mysql instance
resource "google_sql_database_instance" "mysql" {
  name             = "localize-database-instance-mysl"
  region           = var.region
  project          = var.project
  database_version = "MYSQL_5_7"

  settings {
    tier = "db-f1-micro"
  }
}

# Storage files
resource "google_storage_bucket" "static" {
  name          = "localize_bucket"
  location      = "EU"
  force_destroy = true

  uniform_bucket_level_access = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
  cors {
    origin          = ["http://localize-store.com"]
    method          = ["GET", "HEAD", "PUT", "POST", "DELETE"]
    response_header = ["*"]
    max_age_seconds = 3600
  }
}