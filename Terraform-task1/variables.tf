variable "project" {}
variable "credentials_file" {}
variable "region" {}
variable "zone" {}

#This file lists variables, their type, description, etc (empty bracers imply defaults) but actual variables' values are listed in "terraform.tfvars" file. That structure is unneccessary, but helps with modability of your config.