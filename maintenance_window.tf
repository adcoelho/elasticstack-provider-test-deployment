resource "elasticstack_kibana_maintenance_window" "my_maintenance_window" {
  title   = "New Maintenance Window"
  enabled = true

  custom_schedule = {
    start    = "1993-01-01T05:00:00.200Z"
    duration = "24h"

    recurring = {
      every        = "22d"
      end          = "2029-05-17T05:05:40.000Z"
      on_week_day  = ["MO", "+2TU", "-2FR"]
      on_month_day = [1, 2, 4, 5, 8]
      on_month     = [12]
    }
  }

  scope = {
    alerting = {
      kql = "_id: '12345'"
    }
  }
}
