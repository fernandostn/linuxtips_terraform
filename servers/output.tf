output "nome_dns_web-east" {
  #value = aws_instance.web-east[*].public_dns
  value = {
    for instance in aws_instance.web-east:
    instance.id => instance.public_dns
  }
}

/*
output "nome_dns_web-west-2" {
  value = aws_instance.web-west-2.public_dns
}
*/