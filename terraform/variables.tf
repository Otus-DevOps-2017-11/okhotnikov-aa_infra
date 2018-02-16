variable project {
  description = "Project ID"
}

variable region {
  description = "Region"
  default     = "europe-west4-b"
}

variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable disk_image {
  description = "Disk image"
}

variable private_key_path {
  description = "Path to private SSh key"
}

variable gcp_zone {
  description = "Zone in GCP"
  default     = "europe-west4-b"
}
