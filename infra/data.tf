data "aws_region" "current" {}

data "aws_availability_zones" "available" {}

data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

data "aws_subnets" "private_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
  filter {
    name   = "tag:Name"
    values = [var.vpc_private_subnets_name]
  }
}

data "aws_subnet" "private_subnets_values" {
  for_each = toset(data.aws_subnets.private_subnets.ids)
  id       = each.value
}
