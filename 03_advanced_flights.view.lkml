include: "02_medium_flights.view.lkml"

view: advanced_flights {
  extends: [flights]

#########################
#### Security
#########################

  dimension: pilot_ssn {
    type: string
    sql: cast(round(rand() * 10000, 0) as string) ;;
    hidden: yes
  }

  dimension: pilot_ssn_hashed {
    # dummy field used in next dim
    # hidden: yes
    type: number
    group_label: "General Info"
    description: "Only users with sufficient permissions will see this data"
    sql: cast(round(rand() * 10000, 0) as string) ;;
    html:
      {% if _user_attributes["can_see_sensitive_data"]  == 'yes' %}
      {{ value }}
      {% else %}
      ###-##-####
      {% endif %}  ;;
  }

#########################
#### Case Logic to Account for Mergers
#########################

  dimension: merged_carrier_code {
    group_label: "General Info"
    type: string
    sql:
        CASE
          WHEN ${carrier} = 'US' and ${dep_date} > '2013-06-01' then 'AA' --2013 US Air - American Merger
          WHEN ${carrier} = 'NW' and ${dep_date} > '2008-09-01' then 'DL' --2008 Delta - Northwest Merger
        END ;;
  }

#########################
#### Scoring Airports
#########################

  ## Score based on three factors:
      ## What % of flights delayed
      ## What % of flying minutes delayed
      ## % flights above 2 hours
  ## Lower scores are BETTER

  ## % Flying Minutes delayed

  measure: percent_flying_minutes_delayed {
    group_label: "Risk Score"
    type: number
    sql: 1.0 * ${average_delay_length} / ${average_flight_length} ;;
    value_format_name: percent_2
  }

  ## Flights > 2 hours

  measure: count_flights_above_2_horus {
    group_label: "Risk Score"
    type: count
    filters: {
      field: flight_length
      value: ">120"
    }
  }

  measure: percent_flights_above_2_hours {
    group_label: "Risk Score"
    type: number
    sql: 1.0 * ${count_flights_above_2_horus} / nullif(${count},0) ;;
    value_format_name: percent_2
  }

  ## Establish weights

  parameter: weight_percent_flights_delayed {
    type:  unquoted
    default_value: "4"
  }

  parameter: weight_percent_flight_minutes_delayed {
    type:  unquoted
    default_value: "2"
  }

  parameter: weight_percent_flight_over_2_hours {
    type:  unquoted
    default_value: "1"
  }

  dimension: weight_percent_flights_delayed_value {
    type: number
    sql: {% parameter weight_percent_flights_delayed %} ;;
    hidden:  yes
  }

  dimension: weight_percent_flight_minutes_delayed_value {

    type: number
    sql: {% parameter weight_percent_flight_minutes_delayed %} ;;
    hidden:  yes
  }

  dimension: weight_percent_flight_over_2_hours_value {
    type: number
    sql: {% parameter weight_percent_flight_over_2_hours %} ;;
    hidden:  yes
  }

  dimension: sum_weights_dimension {
    type: number
    hidden: yes
    sql:    ${weight_percent_flights_delayed_value} +
            ${weight_percent_flight_minutes_delayed_value} +
            ${weight_percent_flight_over_2_hours_value}
            ;;
  }

  dimension: risk_score_dimension {
    group_label: "Risk Score"
    label: "Risk Score"
    type: number
    sql:
          (
            ${values_by_carrier_by_origin.percent_flights_delayed} * ${weight_percent_flights_delayed_value}
        +   ${values_by_carrier_by_origin.percent_flying_minutes_delayed} * ${weight_percent_flight_minutes_delayed_value}
        +   ${values_by_carrier_by_origin.percent_flights_above_2_hours} * ${weight_percent_flight_over_2_hours_value}
      ) /   nullif(${sum_weights_dimension},0)
    ;;
    value_format_name: percent_2
  }

  measure: average_risk_score {
    group_label: "Risk Score"
    type: average
    sql: ${risk_score_dimension} ;;
    value_format_name: percent_2
  }

  dimension: is_above_risk_score_threshold {
    group_label: "Risk Score"
    type: yesno
    sql:  ${risk_score_dimension} >
          case
            when ${values_by_carrier_by_origin.count} > 50000 then .2
            when ${values_by_carrier_by_origin.count} BETWEEN 10000 and 50000 then .4
            when ${values_by_carrier_by_origin.count} < 10000 then .6
          end ;;
  }

  measure: count_airports_above_threshold {
    group_label: "Risk Score Threshold"
    type: count_distinct
    sql: ${origin} ;;
    filters: {
      field: is_above_risk_score_threshold
      value: "yes"
    }
  }

  measure: count_distinct_airports {
    group_label: "Risk Score Threshold"
    type: count_distinct
    sql: ${origin} ;;
  }

  measure: percent_airports_above_threshold {
    group_label: "Risk Score Threshold"
    type: number
    sql: 1.0 * ${count_airports_above_threshold} / NULLIF(${count_distinct_airports},0) ;;
    value_format_name: percent_2
  }


#########################
#### Predictive Analytics
#########################

}

#########################
#### NDT
#########################


# If necessary, uncomment the line below to include explore_source.
# include: "03_advanced_airlines.model.lkml"

view: values_by_carrier_by_origin {
  derived_table: {
    persist_for: "10 hours"
    explore_source: advanced_flights {
      column: carrier {}
      column: origin {}
      column: percent_flights_delayed {}
      column: percent_flying_minutes_delayed {}
      column: percent_flights_above_2_hours {}
      column: count {}
      filters: {
        field: advanced_flights.minutes_delayed
        value: ">15"
      }
    }
  }

  dimension: pk {
    type: string
    hidden: yes
    primary_key: yes
    sql: concat(${carrier}, '-', ${origin}) ;;
  }
  dimension: carrier {
    hidden: yes
    label: "1 - Flights Carrier"
  }
  dimension: origin {
    hidden: yes
    label: "1 - Flights Origin"
  }
  dimension: percent_flights_delayed {
    hidden: yes
    label: "1 - Flights Percent Flights Delayed"
    value_format: "#,##0.0%"
    type: number
  }
  dimension: percent_flying_minutes_delayed {
    hidden: yes
    label: "1 - Flights Percent Flying Minutes Delayed"
    value_format: "#,##0.00%"
    type: number
  }
  dimension: percent_flights_above_2_hours {
    hidden: yes
    label: "1 - Flights Percent Flights Above 2 Hours"
    value_format: "#,##0.00%"
    type: number
  }
  dimension: count {
    hidden: yes
    label: "1 - Flights Count"
    type: number
  }
}
