view: carriers {
  sql_table_name: faa.carriers ;;

  dimension: code {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: name {
    hidden: yes
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: nickname {
    view_label: "1 - Flights"
    label: "Carrier Name"
    group_label: "General Info"
    type: string
    sql: ${TABLE}.nickname ;;
    link: {
      label: "Carrier Dashboard"
      url: "https://demoexpo.looker.com/dashboards/18?Carrier={{ value }}&Minutes%20Delayed=15"
      icon_url: "http://looker.com/favicon.ico"
    }
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [nickname, name]
  }
}
