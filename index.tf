
resource "elasticstack_kibana_action_connector" "index_example" {
  name              = "my_index_connector"
  connector_type_id = ".index"
  config = jsonencode({
    index              = "my-index"
    executionTimeField = "alert_date"
  })
}
