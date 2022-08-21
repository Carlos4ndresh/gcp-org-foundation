terraform {
  backend "gcs" {
    prefix = "shared/"
    bucket = "shared-resources-tfstate"
  }
}
