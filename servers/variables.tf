variable "image_id" {
  type        = string
  default     = "ami-0f57ffe8bd04fa66d"
  description = "The id of the machine image (AMI) to use for the server."
  validation {
    condition     = length(var.image_id) > 4 && substr(var.image_id, 0, 4) == "ami-"
    error_message = "O valor da variável image_id deve ser uma id AMI válida, iniciando com \"ami-\"."
  }
}

variable "servers" {
}

variable "env" {
  type = string
  default = "staging"
  description = "O Ambinente da instância"
}
 

variable "plus" {
  default = 2
}

variable "production" {
  default = true
}