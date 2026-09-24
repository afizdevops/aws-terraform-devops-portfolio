# AWS Terraform Devops Portfolio

[![Terraform CI](https://github.com/afizdevops/aws-terraform-devops-portfolio/actions/workflows/terraform.yaml/badge.svg)](https://github.com/afizdevops/aws-terraform-devops-portfolio/actions/workflows/terraform.yaml)

AWS infrastructure portfolio demonstrating Terraform,
AWS networking, EC2, Application Load Balancing,
and automated CI validation.


## CI/CD Security

Infrastructure changes are automatically validated using GitHub Actions.

The CI pipeline performs:

- Terraform formatting validation
- Terraform initialization
- Terraform configuration validation
- Trivy Infrastructure-as-Code security scanning
- Pipeline failure for HIGH or CRITICAL security findings
