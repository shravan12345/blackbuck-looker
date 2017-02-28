view: base_fulfillmentcall {
  sql_table_name: zinka.base_fulfillmentcall ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: call_detail_id {
    type: number
    sql: ${TABLE}.call_detail_id ;;
  }

  dimension_group: call {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.call_time ;;
  }

  dimension: called_by_id {
    type: number
    sql: ${TABLE}.called_by_id ;;
  }

  dimension: supplier_id {
    type: number
    sql: ${TABLE}.supplier_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
