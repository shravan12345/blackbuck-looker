view: base_orderdestinations {
  sql_table_name: zinka.base_orderdestinations ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: actual_load {
    type: number
    sql: ${TABLE}.actual_load ;;
  }

  dimension: delivered_load {
    type: number
    sql: ${TABLE}.delivered_load ;;
  }

  dimension: destination_id {
    type: number
    sql: ${TABLE}.destination_id ;;
  }

  dimension_group: left {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.left_time ;;
  }

  dimension: load_type_id {
    type: number
    sql: ${TABLE}.load_type_id ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension_group: start {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.start_time ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension_group: waiting {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.waiting_time ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
