resource "elasticstack_kibana_alerting_rule" "my_es_query_rule" {
  name         = "Elasticsearch query rule"
  consumer     = "stackAlerts"
  rule_type_id = ".es-query"
  enabled      = true
  interval     = "1m"
  alert_delay  = 1
  tags         = ["terraform"]

  params = jsonencode({
    searchType                 = "esQuery"
    timeWindowSize             = 1
    timeWindowUnit             = "d"
    threshold                  = [0]
    thresholdComparator        = ">"
    size                       = 100
    esQuery                    = "{\n    \"query\":{\n      \"match_all\" : {}\n    }\n  }"
    aggType                    = "count"
    groupBy                    = "all"
    termSize                   = 5
    index                      = ["kibana_sample_data_logs"]
    timeField                  = "@timestamp"
    excludeHitsFromPreviousRun = true
    sourceFields               = []
  })

  actions {
    id    = "system-connector-.cases"
    group = "query matched"
    params = jsonencode({
      "subActionParams" : {
        "timeWindow" : "7d",
        "reopenClosedCases" : true,
        "groupingBy" : ["kibana.alert.uuid"],
        "templateId" : null
      },
      "subAction" : "run"
    })

    frequency {
      summary     = false
      notify_when = "onActionGroupChange"
      throttle    = null
    }
  }
}
