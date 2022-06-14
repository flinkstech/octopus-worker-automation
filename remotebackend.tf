terraform {
  backend "gcs" {
    bucket  = "flinks-terraform"
    prefix  = "octopus-worker-creation"
  }
}