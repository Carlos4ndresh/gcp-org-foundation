module "logging-chp001-0822" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "logging"
  project_id = "logging-chp001-0822"
  org_id     = var.org_id
  folder_id  = google_folder.common.name

  billing_account = var.billing_account
}

module "monitoring-dev-chp001-0822" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "monitoring-dev"
  project_id = "monitoring-dev-chp001-0822"
  org_id     = var.org_id
  folder_id  = google_folder.common.name

  billing_account = var.billing_account
}

module "monitoring-nonprod-chp001-0822" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "monitoring-nonprod"
  project_id = "monitoring-nonprod-chp001-0822"
  org_id     = var.org_id
  folder_id  = google_folder.common.name

  billing_account = var.billing_account
}

module "monitoring-prod-chp001-0822" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "monitoring-prod"
  project_id = "monitoring-prod-chp001-0822"
  org_id     = var.org_id
  folder_id  = google_folder.common.name

  billing_account = var.billing_account
}

module "vpc-host-dev-chp001-0822" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "vpc-host-dev"
  project_id = "vpc-host-dev-chp001-0822"
  org_id     = var.org_id
  folder_id  = google_folder.common.name

  billing_account = var.billing_account
}

module "vpc-host-nonprod-chp001-0822" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "vpc-host-nonprod"
  project_id = "vpc-host-nonprod-chp001-0822"
  org_id     = var.org_id
  folder_id  = google_folder.common.name

  billing_account = var.billing_account
}

module "vpc-host-prod-chp001-0822" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "vpc-host-prod"
  project_id = "vpc-host-prod-chp001-0822"
  org_id     = var.org_id
  folder_id  = google_folder.common.name

  billing_account = var.billing_account
}
