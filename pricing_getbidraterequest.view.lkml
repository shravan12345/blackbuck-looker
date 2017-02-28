view: pricing_getbidraterequest {
  sql_table_name: zinka.pricing_getbidraterequest ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: input_file {
    type: string
    sql: ${TABLE}.input_file ;;
  }

  dimension_group: request {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.request_time ;;
  }

  dimension: requested_by_id {
    type: number
    sql: ${TABLE}.requested_by_id ;;
  }

  dimension: response_file {
    type: string
    sql: ${TABLE}.response_file ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
