view: base_orderdynamicpricestatus {
  sql_table_name: zinka.base_orderdynamicpricestatus ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: added_by_id {
    type: number
    sql: ${TABLE}.added_by_id ;;
  }

  dimension_group: end {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.end_time ;;
  }

  dimension: order_dynamic_price_id {
    type: number
    sql: ${TABLE}.order_dynamic_price_id ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension_group: start {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.start_time ;;
  }

  dimension: surge_charge {
    type: number
    sql: ${TABLE}.surge_charge ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
