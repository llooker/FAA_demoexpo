view: destination {
  sql_table_name: faa.airports ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: act_date {
    hidden: yes
    type: string
    sql: ${TABLE}.act_date ;;
  }

  dimension: aero_cht {
    hidden: yes
    type: string
    sql: ${TABLE}.aero_cht ;;
  }

  dimension: c_ldg_rts {
    hidden: yes
    type: string
    sql: ${TABLE}.c_ldg_rts ;;
  }

  dimension: cbd_dir {
    hidden: yes
    type: string
    sql: ${TABLE}.cbd_dir ;;
  }

  dimension: cbd_dist {
    hidden: yes
    type: number
    sql: ${TABLE}.cbd_dist ;;
  }

  dimension: cert {
    hidden: yes
    type: string
    sql: ${TABLE}.cert ;;
  }

  dimension: city {
    hidden: yes
    type: string
    sql: ${TABLE}.city ;;
    drill_fields: [state, full_name]
  }

  dimension: city_full {
    label: "City"
    type: string
    sql: ${city} || ', ' || ${state} ;;
    drill_fields: [state, full_name]
  }

  dimension: cntl_twr {
    hidden: yes
    type: string
    sql: ${TABLE}.cntl_twr ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: county {
    hidden: yes
    type: string
    sql: ${TABLE}.county ;;
  }

  dimension: cust_intl {
    hidden: yes
    type: string
    sql: ${TABLE}.cust_intl ;;
  }

  dimension: elevation {
    type: number
    sql: ${TABLE}.elevation ;;
  }

  dimension: faa_dist {
    hidden: yes
    type: string
    sql: ${TABLE}.faa_dist ;;
  }

  dimension: faa_region {
    hidden: yes
    type: string
    sql: ${TABLE}.faa_region ;;
  }

  dimension: fac_type {
    hidden: yes
    type: string
    sql: ${TABLE}.fac_type ;;
  }

  dimension: fac_use {
    hidden: yes
    type: string
    sql: ${TABLE}.fac_use ;;
  }

  dimension: fed_agree {
    hidden: yes
    type: string
    sql: ${TABLE}.fed_agree ;;
  }

  dimension: full_name {
    type: string
    sql: ${TABLE}.full_name ;;
  }

  dimension: joint_use {
    hidden: yes
    type: string
    sql: ${TABLE}.joint_use ;;
  }

  dimension: latitude {
    hidden: yes
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    hidden: yes
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: major {
    hidden: yes
    type: string
    sql: ${TABLE}.major ;;
  }

  dimension: mil_rts {
    hidden: yes
    type: string
    sql: ${TABLE}.mil_rts ;;
  }

  dimension: own_type {
    hidden: yes
    type: string
    sql: ${TABLE}.own_type ;;
  }

  dimension: site_number {
    hidden: yes
    type: string
    sql: ${TABLE}.site_number ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
    drill_fields: [city, full_name]
    map_layer_name: us_states
  }

  measure: count {
    type: count
    drill_fields: [id, full_name]
  }
}
