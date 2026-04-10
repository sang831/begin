# Terraform skeleton for Milestone 2

This folder provides a starter Infrastructure as Code layout:

- `bootstrap`: creates S3 backend bucket + DynamoDB state lock table
- `modules/network`: VPC, public subnet, internet gateway, route table
- `modules/compute`: security group, EC2 instance, Elastic IP
- `envs/dev` and `envs/prod`: environment-specific stacks

## Prerequisites

- Terraform `>= 1.6.0`
- AWS credentials configured (`aws configure` or environment variables)

## Step 1 - Bootstrap remote state backend

```bash
cd infra/terraform/bootstrap
terraform init
terraform plan
terraform apply
```

After apply, note:

- `terraform_state_bucket`
- `terraform_lock_table`

## Step 2 - Configure dev backend and migrate state

```bash
cd infra/terraform/envs/dev
cp terraform.tfvars.example terraform.tfvars
cp backend.hcl.example backend.hcl
```

Update `backend.hcl` with actual values from step 1, then:

```bash
terraform init -reconfigure -backend-config=backend.hcl
terraform plan
terraform apply
```

If Terraform asks to migrate state from local to remote, answer `yes`.

## Step 3 - Configure prod backend

Repeat the same process in `infra/terraform/envs/prod` with:

- `terraform.tfvars`
- `backend.hcl` (from `backend.hcl.example`)
- `key = "prod/terraform.tfstate"`

## Important notes

- `ami_id` can be left empty (`""`) to auto-resolve latest Amazon Linux 2023 AMI.
- Restrict `allowed_ssh_cidr` to your public IP, not `0.0.0.0/0`.
- Keep `terraform.tfvars` and `backend.hcl` out of git.

