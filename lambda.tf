# Simple AWS Lambda Terraform Example
# requires 'index.js' in the same directory
# to test: run `terraform plan`
# to deploy: run `terraform apply`
variable "aws_region" {
  default = "us-east-1"
}
data "archive_file" "lambda_zip" {
    type          = "zip"
    source_file   = "hello.js"
    output_path   = "hello-world.zip"
}
resource "aws_lambda_function" "hello-world" {
  filename         = "hello-world.zip"
  function_name    = "hello world"
  role             = "${aws_iam_role.iam_for_lambda_tf.arn}"
  handler          = "index.handler"
  source_code_hash = "${data.archive_file.lambda_zip.output_base64sha256}"
  runtime          = "nodejs6.10"
}
resource "aws_iam_role" "iam_for_lambda_tf" {
  name = "iam_for_lambda_tf"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}