data "aws_ssm_parameter" "amazon_linux_ami" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

#trivy:ignore:AWS-0028
#trivy:ignore:AWS-0131
resource "aws_instance" "web" {
  ami                    = data.aws_ssm_parameter.amazon_linux_ami.value
  instance_type          = var.instance_type
  metadata_options {
    http_tokens   = "required"
  }
  
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.web.id]

  user_data = <<-EOF
    #!/bin/bash
    dnf update -y
    dnf install -y nginx

    systemctl enable nginx
    systemctl start nginx

    cat > /usr/share/nginx/html/index.html <<'HTML'
    <!DOCTYPE html>
    <html>
      <head>
        <title>AWS DevOps Portfolio</title>
      </head>
      <body>
        <h1>AWS DevOps Portfolio</h1>
        <p>Infrastructure deployed with Terraform.</p>
        <p>Running on Amazon Linux 2023.</p>
      </body>
    </html>
    HTML
  EOF

  tags = {
    Name = "${var.project_name}-web"
  }
}

