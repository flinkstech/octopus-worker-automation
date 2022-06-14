variable "project_id" {
    description = "The GCP project ID"
    type        = string
}

######### SPOT_VM vars #########

variable "vm_name" {
    description = "The spot VM name"
    type        = string
}

variable "vm_type" {
    description = "The spot VM type"
    type        = string
}

variable "vm_zone" {
    description = "The spot VM zone"
    type        = string
}

variable "vm_img" {
    description = "The spot VM image type"
    type        = string
}

variable "vm_network" {
    description = "The network spot VM is going to be created in"
    type        = string
}