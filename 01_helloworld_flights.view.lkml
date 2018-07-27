view: hello_world_flights {
  sql_table_name: faa.flights ;;

  dimension: origin {
    type: string
    sql: ${TABLE}.origin ;;
  }

  dimension: destination {
    type: string
    sql: ${TABLE}.destination ;;
  }

  dimension: route {
    type: string
    sql: concat(${origin}, '-', ${destination})  ;;
    drill_fields: [origin, destination]
  }

  dimension: carrier {
    type: string
    sql: ${TABLE}.carrier ;;
  }

  dimension_group: dep {
    type: time
    timeframes: [
      raw,
      hour_of_day,
      date,
      month
    ]
    sql: ${TABLE}.dep_time ;;
  }

  dimension_group: arr {
    type: time
    timeframes: [
      raw,
      hour_of_day,
      date,
      month
    ]
    sql: ${TABLE}.arr_time ;;
  }

  measure: count {
    label: "Count Flights"
    type: count
    drill_fields: [origin, destination, count]
  }
}
