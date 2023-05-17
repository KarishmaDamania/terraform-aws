# output "aws_security_gp_details" {
#   value = aws_security_group.http_server_sg
# }

# output "Public_DNS" {
#   value = aws_instance.http_servers
# }

output "elb_public_dns" {
  value = aws_elb.elb
}