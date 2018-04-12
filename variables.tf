variable "do_token" {
  description = "DigitalOcean API token"
}

variable "password" {
  description = "hacluster user password"
}

variable "domain" {
  description = "Domain name"
  default     = "cluster.local"
}

variable "image" {
  description = "DigitalOcean image name"
  default     = "centos-7-x64"
}

variable "region" {
  description = "DigitalOcean region"
  default     = "sgp1"
}

variable "droplet_size" {
  description = "DigitalOcean size"
  default     = "s-1vcpu-1gb"
}
