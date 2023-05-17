


terraform {
    backend "s3" {
        bucket = "dev-applications-backend-state-karishmadamania"
        key = "07-backend-state/resources/dev"
        region = "us-east-1"
        dynamodb_table = "dev_application_lock"
        encrypt = true
    }
}
provider "aws" {
    region = "us-east-1"
}


resource "aws_iam_user" "my_iam_user" {
    name = "${terraform.workspace}-my-user-karishmadamania-001"
}


