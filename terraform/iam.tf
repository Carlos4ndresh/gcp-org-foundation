module "organization-iam" {
  source  = "terraform-google-modules/iam/google//modules/organizations_iam"
  version = "~> 7.4"

  organizations = ["380919848735"]

  bindings = {

    "roles/billing.admin" = [
      "group:gcp-billing-admins@uselessnerd.com",
    ]

    "roles/resourcemanager.organizationAdmin" = [
      "group:gcp-organization-admins@uselessnerd.com",
    ]

  }
}


module "development-iam" {
  source  = "terraform-google-modules/iam/google//modules/folders_iam"
  version = "~> 7.4"

  folders = [google_folder.development.name]

  bindings = {

    "roles/compute.instanceAdmin.v1" = [
      "group:gcp-developers@uselessnerd.com",
    ]

    "roles/container.admin" = [
      "group:gcp-developers@uselessnerd.com",
    ]

    "roles/iap.tunnelResourceAccessor" = [
      "group:gcp-developers@uselessnerd.com",
    ]

  }
}


module "non-production-iam" {
  source  = "terraform-google-modules/iam/google//modules/folders_iam"
  version = "~> 7.4"

  folders = [google_folder.non-production.name]

  bindings = {

    "roles/compute.instanceAdmin.v1" = [
      "group:gcp-developers@uselessnerd.com",
    ]

    "roles/container.admin" = [
      "group:gcp-developers@uselessnerd.com",
    ]

    "roles/iap.tunnelResourceAccessor" = [
      "group:gcp-developers@uselessnerd.com",
    ]

  }
}
