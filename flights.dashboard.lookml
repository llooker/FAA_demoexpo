- dashboard: airline
  title: Airline
  layout: newspaper
  elements:
  - title: "% of Delays by Distance Travelled"
    name: "% of Delays by Distance Travelled"
    model: airlines
    explore: flights
    type: looker_column
    fields:
    - flights.distance_tiers
    - flights.count
    - flights.percent_flights_delayed
    filters:
      flights.distance_tiers: "-Undefined"
    sorts:
    - flights.distance_tiers
    limit: 500
    column_limit: 50
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: flights.percent_flights_delayed
        name: flights Percent Flights Delayed
        axisId: flights.percent_flights_delayed
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    - label:
      orientation: right
      series:
      - id: flights.count
        name: flights Count
        axisId: flights.count
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    series_types:
      flights.percent_flights_delayed: line
    colors:
    - 'palette: Mixed Dark'
    series_colors: {}
    listen:
      Minutes for Delay: flights.minutes_delayed
      Origin City: origin.city_full
      Destination City: destination.city_full
      Carrier: carriers.nickname
      Year: flights.dep_year
      Month: flights.dep_month_name
    row: 22
    col: 0
    width: 8
    height: 6
  - title: Count of Flights
    name: Count of Flights
    model: airlines
    explore: flights
    type: single_value
    fields:
    - flights.count
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Minutes for Delay: flights.minutes_delayed
      Origin City: origin.city_full
      Destination City: destination.city_full
      Carrier: carriers.nickname
      Year: flights.dep_year
      Month: flights.dep_month_name
    row: 2
    col: 0
    width: 6
    height: 6
  - title: "% Flights Delayed"
    name: "% Flights Delayed"
    model: airlines
    explore: flights
    type: single_value
    fields:
    - flights.percent_flights_delayed_plain
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Minutes for Delay: flights.minutes_delayed
      Origin City: origin.city_full
      Destination City: destination.city_full
      Carrier: carriers.nickname
      Year: flights.dep_year
      Month: flights.dep_month_name
    row: 2
    col: 6
    width: 6
    height: 6
  - title: Flights per Day
    name: Flights per Day
    model: airlines
    explore: flights
    type: looker_bar
    fields:
    - flights.is_flight_delayed
    - flights.count
    pivots:
    - flights.is_flight_delayed
    fill_fields:
    - flights.is_flight_delayed
    sorts:
    - flights.count desc 0
    - flights.is_flight_delayed
    limit: 500
    query_timezone: America/Los_Angeles
    stacking: normal
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    series_types: {}
    colors:
    - 'palette: Mixed Dark'
    series_colors: {}
    series_labels:
      No - flights.count: On-Time
      Yes - flights.count: Delayed
    listen:
      Minutes for Delay: flights.minutes_delayed
      Origin City: origin.city_full
      Destination City: destination.city_full
      Carrier: carriers.nickname
      Year: flights.dep_year
      Month: flights.dep_month_name
    row: 2
    col: 12
    width: 7
    height: 6
  - title: Average Delay (Min)
    name: Average Delay (Min)
    model: airlines
    explore: flights
    type: single_value
    fields:
    - flights.average_delay_length
    filters:
      flights.is_flight_delayed: 'Yes'
    limit: 500
    column_limit: 50
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Minutes for Delay: flights.minutes_delayed
      Origin City: origin.city_full
      Destination City: destination.city_full
      Carrier: carriers.nickname
      Year: flights.dep_year
      Month: flights.dep_month_name
    row: 2
    col: 19
    width: 5
    height: 6
  - title: Top Destination Airports
    name: Top Destination Airports
    model: airlines
    explore: flights
    type: looker_column
    fields:
    - destination.city_full
    - flights.is_flight_delayed
    - flights.count
    pivots:
    - flights.is_flight_delayed
    sorts:
    - flights.is_flight_delayed 0
    - flights.count desc 0
    limit: 30
    column_limit: 50
    stacking: normal
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    colors:
    - 'palette: Mixed Dark'
    series_colors: {}
    series_labels:
      No - flights.count: On Time
      Yes - flights.count: Delayed
    listen:
      Minutes for Delay: flights.minutes_delayed
      Origin City: origin.city_full
      Destination City: destination.city_full
      Carrier: carriers.nickname
      Year: flights.dep_year
      Month: flights.dep_month_name
    row: 16
    col: 16
    width: 8
    height: 6
  - title: Top Origin Airports
    name: Top Origin Airports
    model: airlines
    explore: flights
    type: looker_column
    fields:
    - flights.is_flight_delayed
    - flights.count
    - origin.city_full
    pivots:
    - flights.is_flight_delayed
    sorts:
    - flights.is_flight_delayed 0
    - flights.count desc 0
    limit: 30
    column_limit: 50
    stacking: normal
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    colors:
    - 'palette: Mixed Dark'
    series_colors: {}
    series_labels:
      No - flights.count: On Time
      Yes - flights.count: Delayed
    listen:
      Minutes for Delay: flights.minutes_delayed
      Origin City: origin.city_full
      Destination City: destination.city_full
      Carrier: carriers.nickname
      Year: flights.dep_year
      Month: flights.dep_month_name
    row: 16
    col: 8
    width: 8
    height: 6
  - title: Routes with Biggest Elevation Change
    name: Routes with Biggest Elevation Change
    model: airlines
    explore: flights
    type: looker_map
    fields:
    - flights.average_elevation_change
    - flights.origin_location
    - flights.destination_location
    filters:
      flights.average_elevation_change: NOT NULL
      flights.count: ">100"
      origin.state: "-AK,-HI,-PR"
      destination.state: "-AK,-HI,-PR"
    sorts:
    - flights.average_elevation_change desc
    limit: 100
    column_limit: 50
    map_plot_mode: lines
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map: usa
    map_projection: ''
    quantize_colors: false
    stacking: normal
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    colors: []
    series_colors: {}
    series_labels:
      No - flights.count: On Time
      Yes - flights.count: Delayed
    series_types: {}
    listen:
      Minutes for Delay: flights.minutes_delayed
      Origin City: origin.city_full
      Destination City: destination.city_full
      Carrier: carriers.nickname
      Year: flights.dep_year
      Month: flights.dep_month_name
    row: 8
    col: 0
    width: 8
    height: 6
  - title: 100 Most Common Routes in US
    name: 100 Most Common Routes in US
    model: airlines
    explore: flights
    type: looker_map
    fields:
    - flights.origin_location
    - flights.destination_location
    - flights.count
    filters:
      origin.state: "-PR,-HI,-AK"
      destination.state: "-AK,-PR,-HI"
    sorts:
    - flights.count desc
    limit: 100
    column_limit: 50
    map_plot_mode: lines
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: true
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Minutes for Delay: flights.minutes_delayed
      Origin City: origin.city_full
      Destination City: destination.city_full
      Carrier: carriers.nickname
      Year: flights.dep_year
      Month: flights.dep_month_name
    row: 8
    col: 8
    width: 8
    height: 6
  - title: Market Share by Carrier by Year
    name: Market Share by Carrier by Year
    model: airlines
    explore: flights
    type: looker_area
    fields:
    - flights.dep_year
    - carriers.nickname
    - flights.count
    pivots:
    - carriers.nickname
    filters:
      carriers.nickname: Southwest,United,American,Delta,USAir
    sorts:
    - flights.dep_year desc
    - carriers.nickname
    limit: 500
    column_limit: 50
    stacking: percent
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    show_null_points: true
    point_style: none
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    colors:
    - 'palette: Mixed Dark'
    series_colors: {}
    series_types: {}
    hidden_series: []
    listen:
      Minutes for Delay: flights.minutes_delayed
      Origin City: origin.city_full
      Destination City: destination.city_full
      Year: flights.dep_year
      Month: flights.dep_month_name
    row: 8
    col: 16
    width: 8
    height: 6
  - title: "% Delay by Time of Day"
    name: "% Delay by Time of Day"
    model: airlines
    explore: flights
    type: looker_column
    fields:
    - flights.dep_hour_of_day
    - flights.count
    - flights.percent_flights_delayed
    fill_fields:
    - flights.dep_hour_of_day
    sorts:
    - flights.dep_hour_of_day
    limit: 500
    column_limit: 50
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    colors:
    - 'palette: Mixed Dark'
    series_colors: {}
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: flights.count
        name: 1 - Flights Count
        axisId: flights.count
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    - label:
      orientation: right
      series:
      - id: flights.percent_flights_delayed
        name: 1 - Flights Percent Flights Delayed
        axisId: flights.percent_flights_delayed
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    series_labels:
      flights.count: Count of Flights
      flights.percent_flights_delayed: "% Delayed"
    series_types:
      flights.percent_flights_delayed: line
    listen:
      Minutes for Delay: flights.minutes_delayed
      Origin City: origin.city_full
      Destination City: destination.city_full
      Carrier: carriers.nickname
      Year: flights.dep_year
      Month: flights.dep_month_name
    row: 22
    col: 8
    width: 8
    height: 6
  - title: "% Delay by Carrier"
    name: "% Delay by Carrier"
    model: airlines
    explore: flights
    type: looker_column
    fields:
    - flights.count
    - flights.percent_flights_delayed
    - carriers.nickname
    sorts:
    - flights.count desc
    limit: 10
    column_limit: 50
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    colors:
    - 'palette: Mixed Dark'
    series_colors: {}
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: flights.count
        name: 1 - Flights Count
        axisId: flights.count
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    - label:
      orientation: right
      series:
      - id: flights.percent_flights_delayed
        name: 1 - Flights Percent Flights Delayed
        axisId: flights.percent_flights_delayed
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    series_labels:
      flights.count: Count of Flights
      flights.percent_flights_delayed: "% Delayed"
    series_types:
      flights.percent_flights_delayed: line
    listen:
      Minutes for Delay: flights.minutes_delayed
      Origin City: origin.city_full
      Destination City: destination.city_full
      Carrier: carriers.nickname
      Year: flights.dep_year
      Month: flights.dep_month_name
    row: 16
    col: 0
    width: 8
    height: 6
  - title: "% Delay by Month"
    name: "% Delay by Month"
    model: airlines
    explore: flights
    type: looker_column
    fields:
    - flights.count
    - flights.percent_flights_delayed
    - flights.dep_month_name
    fill_fields:
    - flights.dep_month_name
    sorts:
    - flights.dep_month_name
    limit: 500
    column_limit: 50
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    colors:
    - 'palette: Mixed Dark'
    series_colors: {}
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: flights.count
        name: Count of Flights
        axisId: flights.count
      showLabels: true
      showValues: true
      maxValue:
      minValue:
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    - label:
      orientation: right
      series:
      - id: flights.percent_flights_delayed
        name: "% Delayed"
        axisId: flights.percent_flights_delayed
      showLabels: true
      showValues: true
      maxValue:
      minValue:
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    series_labels:
      flights.count: Count of Flights
      flights.percent_flights_delayed: "% Delayed"
    series_types:
      flights.percent_flights_delayed: line
    listen:
      Minutes for Delay: flights.minutes_delayed
      Origin City: origin.city_full
      Destination City: destination.city_full
      Carrier: carriers.nickname
      Year: flights.dep_year
      Month: flights.dep_month_name
    row: 22
    col: 16
    width: 8
    height: 6
  - name: Quick Stats
    type: text
    title_text: Quick Stats
    row: 0
    col: 0
    width: 24
    height: 2
  - name: Delay Deep Dive
    type: text
    title_text: Delay Deep Dive
    subtitle_text: Which flights are most likely to be delayed?
    row: 14
    col: 0
    width: 24
    height: 2
  - title: "% Delay by Date"
    name: "% Delay by Date"
    model: airlines
    explore: flights
    type: looker_column
    fields:
    - flights.dep_month
    - flights.count
    - flights.is_flight_delayed
    pivots:
    - flights.is_flight_delayed
    fill_fields:
    - flights.dep_month
    - flights.is_flight_delayed
    limit: 500
    column_limit: 50
    stacking: normal
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    colors:
    - 'palette: Mixed Dark'
    series_colors: {}
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: flights.count
        name: Count of Flights
        axisId: flights.count
      showLabels: true
      showValues: true
      maxValue:
      minValue:
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    - label:
      orientation: right
      series:
      - id: flights.percent_flights_delayed
        name: "% Delayed"
        axisId: flights.percent_flights_delayed
      showLabels: true
      showValues: true
      maxValue:
      minValue:
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    series_labels:
      flights.count: Count of Flights
      flights.percent_flights_delayed: "% Delayed"
    series_types:
      flights.percent_flights_delayed: line
    listen:
      Minutes for Delay: flights.minutes_delayed
      Origin City: origin.city_full
      Destination City: destination.city_full
      Carrier: carriers.nickname
      Year: flights.dep_year
      Month: flights.dep_month_name
    row: 28
    col: 0
    width: 24
    height: 6
  filters:
  - name: Minutes for Delay
    title: Minutes for Delay
    type: field_filter
    default_value: ">5"
    allow_multiple_values: true
    required: false
    model: airlines
    explore: flights
    listens_to_filters: []
    field: flights.minutes_delayed
  - name: Origin City
    title: Origin City
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: airlines
    explore: flights
    listens_to_filters: []
    field: origin.city_full
  - name: Destination City
    title: Destination City
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: airlines
    explore: flights
    listens_to_filters: []
    field: destination.city_full
  - name: Month
    title: Month
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: airlines
    explore: flights
    listens_to_filters: []
    field: flights.dep_month_name
  - name: Year
    title: Year
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: airlines
    explore: flights
    listens_to_filters: []
    field: flights.dep_year
  - name: Carrier
    title: Carrier
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: airlines
    explore: flights
    listens_to_filters: []
    field: carriers.nickname
