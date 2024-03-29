# VPC and Subnets
module "vpc-host-dev" {
  source  = "terraform-google-modules/network/google"
  version = "~> 6.0"

  project_id   = module.vpc-host-dev-chp001-0822.project_id
  network_name = "vpc-host-dev"

  subnets = [

    {
      subnet_name               = "subnet-dev-1"
      subnet_ip                 = "192.168.100.0/24"
      subnet_region             = "us-west4"
      subnet_private_access     = true
      subnet_flow_logs          = true
      subnet_flow_logs_sampling = "0.5"
      subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
      subnet_flow_logs_interval = "INTERVAL_10_MIN"
    },
    {
      subnet_name               = "subnet-dev-2"
      subnet_ip                 = "192.168.200.0/24"
      subnet_region             = "us-west1"
      subnet_private_access     = true
      subnet_flow_logs          = true
      subnet_flow_logs_sampling = "0.5"
      subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
      subnet_flow_logs_interval = "INTERVAL_10_MIN"
    },
  ]
}
# Firewall Rules
resource "google_compute_firewall" "vpc-host-dev-allow-iap-rdp" {
  name      = "vpc-host-dev-allow-iap-rdp"
  network   = module.vpc-host-dev.network_name
  project   = module.vpc-host-dev-chp001-0822.project_id
  direction = "INGRESS"
  priority  = 10000

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }

  allow {
    protocol = "tcp"
    ports    = ["3389", ]
  }

  source_ranges = [
    "35.235.240.0/20",
  ]
}
resource "google_compute_firewall" "vpc-host-dev-allow-iap-ssh" {
  name      = "vpc-host-dev-allow-iap-ssh"
  network   = module.vpc-host-dev.network_name
  project   = module.vpc-host-dev-chp001-0822.project_id
  direction = "INGRESS"
  priority  = 10000

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", ]
  }

  source_ranges = [
    "35.235.240.0/20",
  ]
}
resource "google_compute_firewall" "vpc-host-dev-allow-icmp" {
  name      = "vpc-host-dev-allow-icmp"
  network   = module.vpc-host-dev.network_name
  project   = module.vpc-host-dev-chp001-0822.project_id
  direction = "INGRESS"
  priority  = 10000

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = [
    "10.128.0.0/9",
  ]
}

resource "google_compute_firewall" "vpc-host-dev-allow-http" {
  name      = "vpc-host-dev-allow-http"
  network   = module.vpc-host-dev.network_name
  project   = module.vpc-host-dev-chp001-0822.project_id
  direction = "INGRESS"
  priority  = 10000

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]

}
# NAT Router and config
resource "google_compute_router" "rt-vpc-host-dev-1000-egress-internet-default" {
  name    = "rt-vpc-host-dev-1000-egress-internet-default"
  project = module.vpc-host-dev-chp001-0822.project_id
  region  = "us-west1"
  network = module.vpc-host-dev.network_self_link
}


# VPC and Subnets
module "vpc-host-nonprod" {
  source  = "terraform-google-modules/network/google"
  version = "~> 6.0"

  project_id   = module.vpc-host-nonprod-chp001-0822.project_id
  network_name = "vpc-host-nonprod"

  subnets = [

    {
      subnet_name               = "subnet-non-prod-1"
      subnet_ip                 = "172.16.100.0/22"
      subnet_region             = "northamerica-northeast2"
      subnet_private_access     = true
      subnet_flow_logs          = true
      subnet_flow_logs_sampling = "0.5"
      subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
      subnet_flow_logs_interval = "INTERVAL_10_MIN"
    },
    {
      subnet_name               = "subnet-non-prod-2"
      subnet_ip                 = "172.16.200.0/22"
      subnet_region             = "us-east1"
      subnet_private_access     = true
      subnet_flow_logs          = true
      subnet_flow_logs_sampling = "0.5"
      subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
      subnet_flow_logs_interval = "INTERVAL_10_MIN"
    },
  ]
}
# Firewall Rules
resource "google_compute_firewall" "vpc-host-nonprod-allow-iap-rdp" {
  name      = "vpc-host-nonprod-allow-iap-rdp"
  network   = module.vpc-host-nonprod.network_name
  project   = module.vpc-host-nonprod-chp001-0822.project_id
  direction = "INGRESS"
  priority  = 10000

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }

  allow {
    protocol = "tcp"
    ports    = ["3389", ]
  }

  source_ranges = [
    "35.235.240.0/20",
  ]
}
resource "google_compute_firewall" "vpc-host-nonprod-allow-iap-ssh" {
  name      = "vpc-host-nonprod-allow-iap-ssh"
  network   = module.vpc-host-nonprod.network_name
  project   = module.vpc-host-nonprod-chp001-0822.project_id
  direction = "INGRESS"
  priority  = 10000

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", ]
  }

  source_ranges = [
    "35.235.240.0/20",
  ]
}
resource "google_compute_firewall" "vpc-host-nonprod-allow-icmp" {
  name      = "vpc-host-nonprod-allow-icmp"
  network   = module.vpc-host-nonprod.network_name
  project   = module.vpc-host-nonprod-chp001-0822.project_id
  direction = "INGRESS"
  priority  = 10000

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = [
    "10.128.0.0/9",
  ]
}
# NAT Router and config
resource "google_compute_router" "rt-vpc-host-nonprod-1000-egress-internet-default" {
  name    = "rt-vpc-host-nonprod-1000-egress-internet-default"
  project = module.vpc-host-nonprod-chp001-0822.project_id
  region  = "us-east1"
  network = module.vpc-host-nonprod.network_self_link
}


# VPC and Subnets
module "vpc-host-prod" {
  source  = "terraform-google-modules/network/google"
  version = "~> 6.0"

  project_id   = module.vpc-host-prod-chp001-0822.project_id
  network_name = "vpc-host-prod"

  subnets = [

    {
      subnet_name               = "subnet-prod-1"
      subnet_ip                 = "10.0.0.0/16"
      subnet_region             = "northamerica-northeast1"
      subnet_private_access     = true
      subnet_flow_logs          = true
      subnet_flow_logs_sampling = "0.5"
      subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
      subnet_flow_logs_interval = "INTERVAL_10_MIN"
    },
    {
      subnet_name               = "subnet-prod-2"
      subnet_ip                 = "192.168.0.0/16"
      subnet_region             = "us-central1"
      subnet_private_access     = true
      subnet_flow_logs          = true
      subnet_flow_logs_sampling = "0.5"
      subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
      subnet_flow_logs_interval = "INTERVAL_10_MIN"
    },
  ]
}
# Firewall Rules
resource "google_compute_firewall" "vpc-host-prod-allow-iap-ssh" {
  name      = "vpc-host-prod-allow-iap-ssh"
  network   = module.vpc-host-prod.network_name
  project   = module.vpc-host-prod-chp001-0822.project_id
  direction = "INGRESS"
  priority  = 10000

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", ]
  }

  source_ranges = [
    "35.235.240.0/20",
  ]
}
# NAT Router and config
resource "google_compute_router" "rt-vpc-host-prod-1000-egress-internet-default" {
  name    = "rt-vpc-host-prod-1000-egress-internet-default"
  project = module.vpc-host-prod-chp001-0822.project_id
  region  = "us-central1"
  network = module.vpc-host-prod.network_self_link
}
