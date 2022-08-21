module "logsink-380919848735-logbucketsink" {
  source  = "terraform-google-modules/log-export/google"
  version = "~> 7.3.0"

  destination_uri      = module.uselessnerd-logging-destination.destination_uri
  log_sink_name        = "380919848735-logbucketsink"
  parent_resource_id   = var.org_id
  parent_resource_type = "organization"
  include_children     = true
}

module "uselessnerd-logging-destination" {
  source  = "terraform-google-modules/log-export/google//modules/logbucket"
  version = "~> 7.4.1"

  project_id               = module.logging-gc389-sd582.project_id
  name                     = "uselessnerd-logging"
  location                 = "global"
  retention_days           = 90
  log_sink_writer_identity = module.logsink-380919848735-logbucketsink.writer_identity
}
