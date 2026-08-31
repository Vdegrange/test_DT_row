terraform {
  required_providers {
    genesyscloud = {
      source  = "MyPureCloud/genesyscloud"
      version = "~> 1.0"
    }
  }
  backend "http" {}
}