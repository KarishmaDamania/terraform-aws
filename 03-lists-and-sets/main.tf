variable "names"{
    default = ["ranga", "tom", "jane"]
}

provider "aws" {
    region = "us-east-1"
}

resource "aws_iam_user" "my_iam_users" {
    for_each = toset(var.names)
    name = each.value
}