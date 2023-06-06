data "databricks_node_type" "interactive_node" {
  local_disk = true
  category = "Storage Optimized"
}

data "databricks_spark_version" "latest_lts" {
  long_term_support = true
}

resource "databricks_cluster" "shared_autoscaling" {
  cluster_name            = "Shared UC Cluster"
  
  idempotency_token       = "4d3b5de0-fa6b-43c9-b358-e8f0c04f867d"       # any unique value to ensure duplicate clusters are not created
  spark_version           = data.databricks_spark_version.latest_lts.id
  node_type_id            = data.databricks_node_type.interactive_node.id
  data_access_mode.       = "USER_ISOLATION"
  
  autotermination_minutes = 60
  autoscale {
    min_workers = 1
    max_workers = 10
  }
  
  custom_tags = {    # Please use all lowercase tag names
    "removeAfter" = "2024-01-31"
  }
}
