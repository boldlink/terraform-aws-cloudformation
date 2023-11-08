terraform {
  required_version = ">= 0.14.11"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.20.0"
    }
    local = {
      source  = "hashicorp/local"
      version = ">=2.4.0"
    }
    null = {
      source  = "hashicorp/null"
      version = ">=3.2.1"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.1.0"
    }
  }
}
