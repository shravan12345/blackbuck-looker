view: pricing_researchedlanerate {
  sql_table_name: zinka.pricing_researchedlanerate ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: deleted {
    type: yesno
    sql: ${TABLE}.deleted ;;
  }

  dimension: destination_city_id {
    type: number
    sql: ${TABLE}.destination_city_id ;;
  }

  dimension_group: end {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.end_date ;;
  }

  dimension: entry_file_id {
    type: number
    sql: ${TABLE}.entry_file_id ;;
  }

  dimension: entry_origin {
    type: string
    sql: ${TABLE}.entry_origin ;;
  }

  dimension: from_google_place_id {
    type: number
    sql: ${TABLE}.from_google_place_id ;;
  }

  dimension: lane_rate {
    type: number
    sql: ${TABLE}.lane_rate ;;
  }

  dimension: last_modified_by_id {
    type: number
    sql: ${TABLE}.last_modified_by_id ;;
  }

  dimension: source_city_id {
    type: number
    sql: ${TABLE}.source_city_id ;;
  }

  dimension_group: start {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.start_date ;;
  }

  dimension: to_google_place_id {
    type: number
    sql: ${TABLE}.to_google_place_id ;;
  }

  dimension: truck_type_id {
    type: number
    sql: ${TABLE}.truck_type_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
