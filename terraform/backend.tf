terraform {

  backend "azurerm" {
    resource_group_name  = "rg-edonusum-test"
    storage_account_name = "stedonusum001"
    container_name       = "terraform"
    key                  = "terraform.tfstate"
  }

}