module "logging-chp001-0822" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 14.0"

  name       = "logging"
  project_id = "logging-chp001-0822"
  org_id     = var.org_id
  folder_id  = google_folder.common.name

  billing_account = var.billing_account
}

module "monitoring-dev-chp001-0822" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 14.0"

  name       = "monitoring-dev"
  project_id = "monitoring-dev-chp001-0822"
  org_id     = var.org_id
  folder_id  = google_folder.common.name

  billing_account = var.billing_account
}

module "monitoring-nonprod-chp001-0822" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 14.0"

  name       = "monitoring-nonprod"
  project_id = "monitoring-nonprod-chp001-0822"
  org_id     = var.org_id
  folder_id  = google_folder.common.name

  billing_account = var.billing_account
}

module "monitoring-prod-chp001-0822" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 14.0"

  name       = "monitoring-prod"
  project_id = "monitoring-prod-chp001-0822"
  org_id     = var.org_id
  folder_id  = google_folder.common.name

  billing_account = var.billing_account
}

module "vpc-host-dev-chp001-0822" {
  source = "terraform-google-modules/project-factory/google"

  name       = "vpc-host-dev"
  project_id = "vpc-host-dev-chp001-0822"
  org_id     = var.org_id
  folder_id  = google_folder.common.name

  enable_shared_vpc_host_project = true

  billing_account = var.billing_account

  activate_apis = [
    "compute.googleapis.com",
    "cloudresourcemanager.googleapis.com"
  ]


}

module "vpc-host-nonprod-chp001-0822" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 14.0"

  name       = "vpc-host-nonprod"
  project_id = "vpc-host-nonprod-chp001-0822"
  org_id     = var.org_id
  folder_id  = google_folder.common.name

  billing_account = var.billing_account

  activate_apis = [
    "compute.googleapis.com",
    "run.googleapis.com",
    "container.googleapis.com",
    "vpcaccess.googleapis.com",
    "networkmanagement.googleapis.com",
    "monitoring.googleapis.com",
    "artifactregistry.googleapis.com"
  ]
  activate_api_identities = [
    {
      api = "run.googleapis.com"
      roles = [
        "roles/run.admin",
        "roles/run.developer",
        "roles/run.invoker"
      ]
    }
  ]
}

module "vpc-host-prod-chp001-0822" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 14.0"

  name       = "vpc-host-prod"
  project_id = "vpc-host-prod-chp001-0822"
  org_id     = var.org_id
  folder_id  = google_folder.common.name

  billing_account = var.billing_account

  activate_apis = [
    "compute.googleapis.com",
    "run.googleapis.com",
    "container.googleapis.com",
    "vpcaccess.googleapis.com",
    "networkmanagement.googleapis.com",
    "monitoring.googleapis.com",
  ]
  activate_api_identities = [
    {
      api = "run.googleapis.com"
      roles = [
        "roles/run.admin",
        "roles/run.developer",
        "roles/run.invoker"
      ]
    }
  ]

}

module "gcp-ide-cloud-dev-chp001" {
  source = "terraform-google-modules/project-factory/google"

  name              = "gcp-ide-cloud"
  project_id        = "gcp-ide-cloud-chp001"
  random_project_id = true
  org_id            = var.org_id
  folder_id         = google_folder.development.name

  billing_account      = var.billing_account
  svpc_host_project_id = module.vpc-host-dev-chp001-0822.project_id
  # shared_vpc_subnets   = module.vpc-host-dev.subnets_self_links

  activate_apis = [
    "compute.googleapis.com",
    "run.googleapis.com",
    "container.googleapis.com",
    "vpcaccess.googleapis.com",
    "monitoring.googleapis.com",
    "artifactregistry.googleapis.com",
    "identitytoolkit.googleapis.com",
    "secretmanager.googleapis.com",
    "sqladmin.googleapis.com",
    "sql-component.googleapis.com",
    "cloudbuild.googleapis.com",
    "containerregistry.googleapis.com",
    "certificatemanager.googleapis.com"
  ]
  activate_api_identities = [
    {
      api = "run.googleapis.com"
      roles = [
        "roles/run.admin",
        "roles/run.developer",
        "roles/run.invoker"
      ]
    }
  ]
}
