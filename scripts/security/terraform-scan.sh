#!/bin/bash
# Additional security scanning for Terraform files

set -e

echo "Running additional Terraform security scans..."

# Check for hardcoded AWS credentials
if grep -r "aws_access_key_id\|aws_secret_access_key" --include="*.tf" .; then
  echo "ERROR: Hardcoded AWS credentials found!"
  exit 1
fi

# Check for hardcoded passwords
if grep -r "password\s*=\s*\"[^\"]\+\"" --include="*.tf" . | grep -v "random_password"; then
  echo "WARNING: Potential hardcoded passwords found!"
fi

# Check for public S3 buckets
if grep -r "acl\s*=\s*\"public-read\"" --include="*.tf" .; then
  echo "WARNING: Public S3 bucket configuration found!"
fi

echo "Security scan completed."
EOF

# Make the script executable
chmod +x scripts/security/terraform-scan.sh