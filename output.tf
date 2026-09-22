output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.main.id
}

output "web_server_url" {
  description = "Public URL of portfolio web server"
  value       = "http://${aws_instance.web.public_ip}"
}

output "application_url" {
  description = "URL of the portfolio application"
  value       = "http://${aws_lb.web.dns_name}"
}