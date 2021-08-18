#HCL - Hashicorp Configuration Language
#Declarative Language

resource "google_storage_bucket" "static-site" {
  #Resource configuration parameters
  name                        = "${var.base_bucket_name}-${var.enviroment}-${var.account_number}"
  location                    = "US"
  project                     = "edc-moduloi"
  uniform_bucket_level_access = true
  force_destroy               = true


  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      with_state = "ANY"
    }
  }

}
