variable "users" {
  default = {
    ranga : { country : "A" },
    tom : { country : "B" },
    jane : { country : "C" }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "my_iam_users" {
  for_each = var.users
  name     = each.key
  tags = {
    country : each.value.country
  }
}