# TFLint Configuration for EKS Auto Mode DevSecOps

plugin "terraform" {
  enabled = true
  preset  = "recommended"
}

plugin "aws" {
  enabled = true
  version = "0.29.0"
  source  = "github.com/terraform-linters/tflint-ruleset-aws"
}

# EKS-specific rules
rule "aws_eks_cluster_invalid_version" {
  enabled = true
}

rule "aws_iam_role_policy_invalid_policy" {
  enabled = true
}

# Security-focused rules
rule "aws_security_group_rule_invalid_protocol" {
  enabled = true
}

rule "terraform_required_providers" {
  enabled = true
}

rule "terraform_required_version" {
  enabled = true
}

rule "terraform_naming_convention" {
  enabled = true
  format  = "snake_case"
}

rule "terraform_documented_variables" {
  enabled = true
}

rule "terraform_documented_outputs" {
  enabled = true
}