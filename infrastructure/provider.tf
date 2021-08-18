provider "google" {
  project = "edc-moduloi"

}

#Centralizing the terraform state control file

terraform {
  backend "gcs" {
    bucket      = "terraform-state-janduy"
    prefix      = "state/igti/edc/mod1/terraform.tfstate"
    credentials = secrets.GCP_CREDENTIALS
  }
}
