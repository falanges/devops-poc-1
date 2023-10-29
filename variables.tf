variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "docker_image" {
  description = "Docker image to deploy"
  type        = string
  default     = "ffalanges/mono-web:v1"
}