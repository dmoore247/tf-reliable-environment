terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "1.18.0"
    }
  }
}

// Initialize databricks provider; Use DATABRICKS_HOST and DATABRICKS_TOKEN for authentication
provider "databricks" { }
