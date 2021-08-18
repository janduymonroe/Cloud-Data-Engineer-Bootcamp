#HCL - Hashicorp Configuration Language
#Declarative Language

resource "google_project_service" "storage" {
  service = "storage-api.googleapis.com"
}
resource "google_storage_bucket" "static-site" {
  #Resource configuration parameters
  name                        = "${var.base_bucket_name}-${var.enviroment}-${var.account_number}"
  location                    = "us.east1"
  project                     = "edc-moduloi"
  uniform_bucket_level_access = true
  force_destroy               = true

resource "google_project_iam_custom_role" "gcs-project-role" {
  role_id     = "GCIGTIIamRole"
  title       = "GCS IAM role for project access"
  description = "Bare minimum permissions for the upload-cloud-storage SA."
  project     = google_project_service.storage.project
  permissions = [
    "storage.objects.create",
    "storage.objects.get",
    "storage.objects.list",
    "storage.objects.delete",
    "storage.buckets.get",
    "storage.buckets.list",
    "storage.buckets.create",
    "storage.buckets.delete",
  ]
}

# Create the service account.
resource "google_service_account" "upload-cloud-storage-sa" {
  project      = google_project_service.storage.project
  account_id   = var.upload_cloud_storage_it_sa_name
  display_name = var.upload_cloud_storage_it_sa_name
}

# Assign the custom IAM role to the service account.
resource "google_project_iam_member" "upload-cloud-storage-access" {
  role   = google_project_iam_custom_role.gcs-project-role.id
  member = "serviceAccount:${google_service_account.upload-cloud-storage-sa.email}"
}

# Create service account key.
resource "google_service_account_key" "key" {
  service_account_id = google_service_account.upload-cloud-storage-sa.name
}
