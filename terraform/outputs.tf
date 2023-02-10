output "vpc_dev_shared_id" {
  value = module.vpc-host-nonprod-chp001-0822.project_id
}

output "gcp_ide_cloud_project_id" {
  value = module.gcp-ide-cloud-dev-chp001.project_id
}
