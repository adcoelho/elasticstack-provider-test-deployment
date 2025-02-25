resource "elasticstack_kibana_action_connector" "my_index_connector" {
  name              = "index-connector-1"
  connector_type_id = ".index"

  config = jsonencode({
    index = ".test-index"
  })
}

resource "elasticstack_kibana_alerting_rule" "my_index_threshold_rule" {
  name     = "Index threshold rule"
  consumer = "alerts"
  params = jsonencode({
    "timeSize" : 5,
    "timeUnit" : "m",
    "logView" : {
      "type" : "log-view-reference",
      "logViewId" : "default"
    },
    "count" : {
      "value" : 75,
      "comparator" : "more than"
    },
    "criteria" : [
      {
        "field" : "_id",
        "comparator" : "matches",
        "value" : "33"
      }
    ]
  })
  rule_type_id = "logs.alert.document.count"
  interval     = "1m"
  enabled      = true
  tags         = ["terraform"]

  actions {
    id    = elasticstack_kibana_action_connector.index_example.connector_id
    group = "logs.threshold.fired"
    params = jsonencode({
      "documents" : [{
        "rule_id" : "{{rule.id}}",
        "rule_name" : "{{rule.name}}",
        "message" : "{{context.message}}"
      }]
    })

    frequency {
      summary     = true
      notify_when = "onActionGroupChange"
      throttle    = "10m"
    }

    alerts_filter {
      kql = "kibana.alert.action_group: \"slo.burnRate.alert\""

      timeframe {
        days        = [7]
        timezone    = "Pacific/Honolulu"
        hours_start = "02:00"
        hours_end   = "03:00"
      }
    }
  }
}
