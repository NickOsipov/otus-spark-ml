variable "folder_id" {
  type        = string
  description = "Yandex Cloud Folder ID"
}

variable "zone" {
  type        = string
  description = "Zone for Yandex Cloud resources"
}

variable "instance_name" {
  type        = string
  description = "Name of the virtual machine" 
}

variable "image_id" {
  type        = string
  description = "ID of the image for the virtual machine"
}

variable "subnet_id" {
  type        = string
  description = "ID of the custom subnet"
}

variable "subnet_name" {
  type        = string
  description = "Name of the custom subnet"
}

variable "service_account_id" {
  type        = string
  description = "ID of the service account"
}

variable "public_key_path" {
  type        = string
  description = "Path to the public key file"
}

variable "private_key_path" {
  type        = string
  description = "Path to the private key file"
}

variable "token" {
  type        = string
  description = "Yandex Cloud OAuth token"
}