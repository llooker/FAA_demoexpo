connection: "lookerdata"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

explore: hello_world_flights {
  # label: "01 - Hello World - Flight Data"
  # view_label: "Airlines"
}
