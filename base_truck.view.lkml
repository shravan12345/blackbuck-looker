view: base_truck {

  sql_table_name: zinka.base_truck ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: body {
    type: string
    sql: ${TABLE}.body ;;
  }

  dimension: body_type {
    type: number
    sql: ${TABLE}.body_type ;;
  }

  dimension: breadth {
    type: string
    sql: ${TABLE}.breadth ;;
  }

  dimension: chassis_num_image {
    type: string
    sql: ${TABLE}.chassis_num_image ;;
  }

  dimension: chassis_number {
    type: string
    sql: ${TABLE}.chassis_number ;;
  }

  dimension: created_by_id {
    type: number
    sql: ${TABLE}.created_by_id ;;
  }

  dimension: current_location {
    type: string
    sql: ${TABLE}.current_location ;;
  }

  dimension: data_obtained {
    type: string
    sql: ${TABLE}.data_obtained ;;
  }

  dimension_group: date_added {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date_added ;;
  }

  dimension: driver_available {
    type: yesno
    sql: ${TABLE}.driver_available ;;
  }

  dimension: driver_id {
    type: number
    sql: ${TABLE}.driver_id ;;
  }

  dimension_group: dt_loc_updated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_loc_updated ;;
  }

  dimension: fitness_image {
    type: string
    sql: ${TABLE}.fitness_image ;;
  }

  dimension: fixed_rate {
    type: number
    sql: ${TABLE}.fixed_rate ;;
  }

  dimension: fuel_type {
    type: string
    sql: ${TABLE}.fuel_type ;;
  }

  dimension: has_power_outlet {
    type: yesno
    sql: ${TABLE}.has_power_outlet ;;
  }

  dimension: have_atm_card {
    type: yesno
    sql: ${TABLE}.have_atm_card ;;
  }

  dimension: height {
    type: string
    sql: ${TABLE}.height ;;
  }

  dimension: home_location_id {
    type: number
    sql: ${TABLE}.home_location_id ;;
  }

  dimension: insurance_image {
    type: string
    sql: ${TABLE}.insurance_image ;;
  }

  dimension: is_intracity {
    type: yesno
    sql: ${TABLE}.is_intracity ;;
  }

  dimension: last_modified_by_id {
    type: number
    sql: ${TABLE}.last_modified_by_id ;;
  }

  dimension: latest_loc_lat {
    type: number
    sql: ${TABLE}.latest_loc_lat ;;
  }

  dimension: latest_loc_lng {
    type: number
    sql: ${TABLE}.latest_loc_lng ;;
  }

  dimension: length {
    type: string
    sql: ${TABLE}.length ;;
  }

  dimension: make {
    type: string
    sql: ${TABLE}.make ;;
  }

  dimension: make1 {
    type: number
    sql: ${TABLE}.make1 ;;
  }

  dimension: make_comment {
    type: string
    sql: ${TABLE}.make_comment ;;
  }

  dimension: mobile_details_id {
    type: number
    sql: ${TABLE}.mobile_details_id ;;
  }

  dimension: model {
    type: string
    sql: ${TABLE}.model ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: owned_by {
    type: string
    sql: ${TABLE}.owned_by ;;
  }

  dimension: owner_available {
    type: yesno
    sql: ${TABLE}.owner_available ;;
  }

  dimension: owner_id {
    type: number
    sql: ${TABLE}.owner_id ;;
  }

  dimension: passing_weight {
    type: number
    sql: ${TABLE}.passing_weight ;;
  }

  dimension: permit_image {
    type: string
    sql: ${TABLE}.permit_image ;;
  }

  dimension: photos {
    type: string
    sql: ${TABLE}.photos ;;
  }

  dimension: quality {
    type: string
    sql: ${TABLE}.quality ;;
  }

  dimension: rate_per_km {
    type: number
    sql: ${TABLE}.rate_per_km ;;
  }

  dimension: rc_image {
    type: string
    sql: ${TABLE}.rc_image ;;
  }

  dimension: registration_number {
    type: string
    sql: ${TABLE}.registration_number ;;
  }

  dimension: smartphone_present {
    type: yesno
    sql: ${TABLE}.smartphone_present ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: tef_image {
    type: string
    sql: ${TABLE}.tef_image ;;
  }

  dimension: tonnage {
    type: number
    sql: ${TABLE}.tonnage ;;
  }

  dimension: truck_type_comment {
    type: string
    sql: ${TABLE}.truck_type_comment ;;
  }

  dimension: truck_type_id {
    type: number
    sql: ${TABLE}.truck_type_id ;;
  }

  dimension: wheels {
    type: number
    sql: ${TABLE}.wheels ;;
  }

  dimension: year {
    type: string
    sql: ${TABLE}.year ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }

  dimension: truck_type_name {
    sql: ${base_trucktype.truck_type} ;;
  }

  dimension: home_location_name {
    sql: CASE WHEN ${home_location_id} THEN ${From_City.city} ;;

  }


}
