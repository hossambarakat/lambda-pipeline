module "hello_lambda_function" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = "hello-lambda"
  description   = "My awesome lambda function"
  handler       = "index.lambda_handler"
  runtime       = "python3.12"

  source_path = "../src/hello-lambda"

  memory_size              = 128
  timeout                  = 30

  layers = [
    "arn:aws:lambda:${data.aws_region.current.name}:017000801446:layer:AWSLambdaPowertoolsPythonV2:76"
  ]
  environment_variables = {
    POWERTOOLS_SERVICE_NAME = "HelloLambda"
  }
  
}

