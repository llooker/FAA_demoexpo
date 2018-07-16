connection: "lookerdata"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

explore: flights {

  label: "Flight Data"

  sql_always_where: ${flight_length} > 0 and ${flight_length} < 1500 ;;

  view_label: "1 - Flights"

  join: origin {
    view_label: "2 - Origin Airport"
    relationship: many_to_one
    sql_on: ${flights.origin} = ${origin.code} ;;
  }

  join: destination {
    view_label: "3 - Destination Airport"
    relationship: many_to_one
    sql_on: ${flights.destination} = ${destination.code} ;;
  }

  join: carriers  {
    view_label: "4 - Carriers"
    relationship: many_to_one
    sql_on: ${flights.carrier} = ${carriers.code} ;;
  }
}
