connection: "lookerdata"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

explore: flights {

  from: hello_world_flights

  label: "Hello World Flights"

}
