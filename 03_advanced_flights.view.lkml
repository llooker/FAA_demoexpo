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
#### Scoring Airports
#########################

}
