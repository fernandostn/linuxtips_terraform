module "servers" {
  source = "./servers"
  servers = 1 #input que precisa ser definido no módulo filho
  /*providers = {
    aws = "aws.w2"
  }*/
}

output "nome_dns_web-east" {
  value = module.servers.nome_dns_web-east
}
