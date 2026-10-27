variable "region" {
  description = "Value of the AWS region to create resources in"
  default     = "us-east-2"
}

variable "key_pair" {
  description = "The name of the key pair to use for the instance"
  default     = <<-EOT
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDDZiIIxwqjLBq3kZQSKALY9NrraKEHw6ZOW6Qdss+U3R3dgShh9/0ZmuTs+A/T/1VoYnZFH2qwpVf02oneJaZzimIZ6ErTNIqgdIdYpvEv/c2Dgw6VXYvPmxgo531ILWtukx1ZHOZ7ZCkbAXukMMdC9Dhq6trsI3CkZnZAMCEyqXZM+7fEmb+3E64ihBau7Y8iolesARhm0L3ZZ7vCzJxjjiQDyj3r464PDaDfixzrnlZ304iIH7NZmDhXV4w29uBrfdjcbN6FdP1E6vkNOEV+FRgjCYql6I8a3pGH370vkN0HSlWJSdb+K8ZeZdSRl+Ku/6jq+afWp1pe0GdJOwKRXr5yLYxqTRAPkGFI1dDfcwDFrlLESbZ/S9EYbIfbLDQGteeH5uI9MF0I8b6FtFYrvrkauyQG9DKUmfkFybWkBwemZUsmA0x52bzT2DK1JtZJOCbKOJxAT9laXYCCUhAyq4CcPdS324lyoOOT1Jt8j3QdSs4SbPQ6fUQGJwsVRgk= ec2-user@terraform-vm
  EOT
}
