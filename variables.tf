variable "region" {
  description = "Value of the AWS region to create resources in"
  default     = "us-east-2"
}

variable "key_pair" {
  description = "The name of the key pair to use for the instance"
  default     = "015"
}