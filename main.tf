terraform {
  required_version = ">= 0.14"
  required_providers {
    google = "~> 4.22.0"
    google-beta = "~> 4.21.0"
  }
}

provider "google" {
    project = var.project_id 
}

provider "google-beta" {
  project     = var.project_id
  # region      = "us-central1"
  # zone        = "us-central1-c"
}

data "google_project" "project" {
    project_id = var.project_id    
}

module "spot_vm" {
  source        = "./spot-vm"
  vm_name       = var.vm_name
  vm_type       = var.vm_type
  vm_zone       = var.vm_zone
  vm_img        = var.vm_img
  vm_network    = var.vm_network
}