variable project {
  description = "Project ID"
}

variable region {
  description = "Region"
  default     = "europe-west1"
}

variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable private_key_path {
  description = "Path to the private key used for ssh access"
}

variable disk_image {
  description = "Disk image"
}

variable app_zone {
  description = "Zone"
  default     = "europe-west1-b"
}

variable num_of_apps {
  description = "number of instances"
  default     = 2
}

variable "instance_names" {
  description = "Names for created several instances"

  default = {
    "0" = "reddit-app"
    "1" = "reddit-app2"
  }
}
