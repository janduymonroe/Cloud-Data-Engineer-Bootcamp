variable "base_bucket_name" {
  default = "datalake-igti-tf"
}

variable "enviroment" {
  default = "production"
}

variable "account_number" {
  default = "2561355412513"
}

variable "google_cloud_region" {
  default = "us-east1"
}

variable "upload_cloud_storage_it_sa_name" {
  type    = string
  default = "upload-gcs-it-infra-sa"
}
