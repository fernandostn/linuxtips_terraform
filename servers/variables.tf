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

variable "environment" {
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

variable "sg" {
  type = list(number)
  default = [1,2,3,4]
  description = "Lista de SG para esta instância"

}

variable "instance_type" {
  type = list(string)
  default = ["t2.micro","t3.medium"]
  description = "List of instance type"
  
}

/*
variable "blocks" {
  type = list(object({
    device_name = string
    volume_size = string
    volume_type = string
  }))
  description = "Lista do bloco dinâmico EBS"
}
*/

variable "name" {
  type = string
  default = "Tomás"
  description = "nome do Helo World"
  
}