resource "aws_security_group" "hello_lambda_security_group" {
  name        = "hello-lambda-sg"
  description = "The security group used by the hello lambda"
  vpc_id      = data.aws_vpc.vpc.id
  egress = [
    {
      description = "Enable HTTPs connection to VPC"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = [
        data.aws_vpc.vpc.cidr_block
      ]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]
  lifecycle {
    create_before_destroy = true
  }
}
