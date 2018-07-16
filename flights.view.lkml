view: flights {
  sql_table_name: faa.flights ;;

#######################
# Example 1: % of Delays
#######################

## Define Delay

  dimension: dep_delay {
    group_label: "Timing"
    type: number
    sql: ${TABLE}.dep_delay ;;
  }

  filter: minutes_delayed {
    type: number
    default_value: ">5"
  }

  dimension: is_flight_delayed {
    group_label: "Timing"
    type: yesno
    sql:{% condition minutes_delayed %} ${dep_delay} {% endcondition %} ;;
    drill_fields: [route_cities, distance_tiers]
  }

## Define % of Flights Delayed

  measure: average_delay_length {
    type: average
    sql: ${dep_delay} ;;
    filters: {
      field: is_flight_delayed
      value: "Yes"
    }
    drill_fields: [route_cities, dep_delay, carriers.nickname, count]
  }

  measure: count {
    type: count
    drill_fields: [drill*]
  }

  measure: count_delayed_flights {
    type: count
    filters: {
      field: is_flight_delayed
      value: "Yes"
    }
    drill_fields: [drill*]
  }

  measure: percent_flights_delayed {
    type: number
    sql: 1.0 * ${count_delayed_flights} / nullif(${count},0) ;;
    html: {{ rendered_value }} = {{ count_delayed_flights._rendered_value }} Delays / {{ count._rendered_value }} Total ;;
    value_format_name: percent_2
    drill_fields: [drill*]
  }

#   measure: percentile_of_delays {
#     type: percentile
#     sql: ${percent_flights_delayed} ;;
#   }

  measure: percent_flights_delayed_plain {
    label: "Percent Flights Delayed (No Help Text)"
    type: number
    sql: 1.0 * ${count_delayed_flights} / nullif(${count},0) ;;
    # html: {{ rendered_value }} = {{ count_delayed_flights._rendered_value }} Delays / {{ count._rendered_value }} Total ;;
    value_format_name: percent_2
    drill_fields: [drill*]
  }

#######################
# Example 2: Flight Length
#######################

  dimension_group: dep {
    type: time
    timeframes: [
      raw,
      hour_of_day,
      day_of_month,
      month_name,
      date,
      month,
      year
    ]
    sql: ${TABLE}.dep_time ;;
  }

  dimension_group: arr {
    type: time
    timeframes: [
      raw,
      hour_of_day,
      day_of_month,
      month_name,
      date,
      month,
      year
    ]
    sql: ${TABLE}.arr_time ;;
  }

  dimension: flight_length {
    group_label: "Timing"
    type: number
    sql: datediff(minute,${dep_raw}, ${arr_raw}) ;;
  }

  dimension: flight_length_tier {
    group_label: "Timing"
    type: tier
    sql: ${flight_length} ;;
    tiers: [60,120,180]
    style: integer
    drill_fields: [flight_length]
  }

  measure: average_flight_length {
    type: average
    sql: ${flight_length} ;;
    drill_fields: [route_cities, flight_length, count]
  }

#######################
# Example 3: Route
#######################

  dimension: origin {
    group_label: "Location / Distance"
    type: string
    sql: ${TABLE}.origin ;;
    drill_fields: [destination, carriers.nickname, route_cities]
  }

  dimension: destination {
    group_label: "Location / Distance"
    type: string
    sql: ${TABLE}.destination ;;
    drill_fields: [origin, carriers.nickname, route_cities]
  }

  dimension: route {
    group_label: "Location / Distance"
    type: string
    sql: ${origin} || '-' || ${destination}  ;;
    drill_fields: [origin, carriers.nickname, destination]
  }

  dimension: route_cities {
    group_label: "Location / Distance"
    type: string
    sql: ${origin.city_full} || '-' || ${destination.city_full}  ;;
    drill_fields: [origin.city_full, carriers.nickname, destination.city_full]
  }

  dimension: route_full_name {
    group_label: "Location / Distance"
    type: string
    sql: ${origin.full_name} || '-' || ${destination.full_name}  ;;
    drill_fields: [origin.full_name, carriers.nickname, destination.full_name]
  }


#######################
# Example 4: Average Distance
#######################

  dimension: destination_location {
    view_label: "3 - Destination Airport"
    type: location
    sql_latitude:${destination.latitude} ;;
    sql_longitude:${destination.longitude} ;;
    drill_fields: [destination.full_name]
  }

  dimension: origin_location {
    view_label: "2 - Origin Airport"
    type: location
    sql_latitude:${origin.latitude} ;;
    sql_longitude:${origin.longitude} ;;
    drill_fields: [origin.full_name]
  }

  dimension: route_distance {
    group_label: "Location / Distance"
    type: distance
    start_location_field: origin_location
    end_location_field: destination_location
    units: miles
    drill_fields: [distance_tiers]
  }

  dimension: distance_tiers {
    group_label: "Location / Distance"
    type: tier
    tiers: [250, 500, 1000, 1500]
    style: integer
    sql: ${route_distance} ;;
    drill_fields: [route_distance]
  }

  measure: average_distance {
    type: average
    sql: ${route_distance} ;;
    drill_fields: [route_cities, route_distance, carriers.nickname, count]
  }

#######################
# Example 5: Elevation Change
#######################

  dimension: elevation_change {
    group_label: "Location / Distance"
    type: number
    sql: ${destination.elevation} - ${origin.elevation} ;;
    drill_fields: [route]
  }

  dimension: elevation_change_absolute {
    hidden: yes
    type: number
    sql: abs(${destination.elevation} - ${origin.elevation}) ;;
    drill_fields: [route]
  }

  measure: average_elevation_change {
    type: average
    sql: ${elevation_change_absolute} ;;
    drill_fields: [route_cities, origin.elevation, destination.elavation, carriers.nickname, count]
  }

#######################
# Other
#######################

  dimension: arr_delay {
    group_label: "Timing"
    type: number
    sql: ${TABLE}.arr_delay ;;
  }

  dimension: cancelled {
    hidden: yes
    type: string
    sql: ${TABLE}.cancelled ;;
  }

  dimension: carrier {
    # group_label: "General Info"
    hidden: yes
    type: string
    sql: ${TABLE}.carrier ;;
  }

  dimension: distance {
    hidden: yes
    type: number
    sql: ${TABLE}.distance ;;
  }

  dimension: diverted {
    hidden: yes
    type: string
    sql: ${TABLE}.diverted ;;
  }

  dimension: flight_num {
    group_label: "General Info"
    type: string
    sql: ${TABLE}.flight_num ;;
  }

  dimension: flight_time {
    hidden: yes
    type: number
    sql: ${TABLE}.flight_time ;;
  }

  dimension: id2 {
    hidden: yes
    type: number
    sql: ${TABLE}.id2 ;;
  }

  dimension: tail_num {
    hidden: yes
    type: string
    sql: ${TABLE}.tail_num ;;
  }

  dimension: taxi_in {
    hidden: yes
    type: number
    sql: ${TABLE}.taxi_in ;;
  }

  dimension: taxi_out {
    hidden: yes
    type: number
    sql: ${TABLE}.taxi_out ;;
  }

  set: drill {
    fields: [
      carriers.nickname,
      route_cities,
      count_delayed_flights,
      count
    ]
  }
}
