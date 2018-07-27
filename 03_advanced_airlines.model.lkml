connection: "lookerdata"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

explore: advanced_flights {

  label: "Advanced Flights"

  sql_always_where: ${flight_length} > 0 and ${flight_length} < 2000 ;;

  view_label: "1 - Flights"

  ## Note: default value is "American"
  access_filter: {
    field: carriers.nickname
    user_attribute: carrier_name
  }

  join: origin {
    view_label: "2 - Origin Airport"
    relationship: many_to_one
    sql_on: ${advanced_flights.origin} = ${origin.code} ;;
  }

  join: destination {
    view_label: "3 - Destination Airport"
    relationship: many_to_one
    sql_on: ${advanced_flights.destination} = ${destination.code} ;;
  }

  join: carriers  {
    view_label: "4 - Carriers"
    relationship: many_to_one
    sql_on: ${advanced_flights.carrier} = ${carriers.code} ;;
  }
}
