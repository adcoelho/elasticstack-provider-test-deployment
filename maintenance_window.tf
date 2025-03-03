resource "elasticstack_kibana_maintenance_window" "my_maintenance_window" {
  title    = "Foobar Maintenance Window"
  enabled  = true
  start    = "1992-01-01T05:00:00.200Z"
  duration = 3600000

}
