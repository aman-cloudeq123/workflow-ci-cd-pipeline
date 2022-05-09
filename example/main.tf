module "sc-group"{
    for_each = var.role
    source = "../"
    env=each.key
    Role=each.value.Role
}

provider "aws" {
    profile = "default"
    region = "us-west-1"
  
}
