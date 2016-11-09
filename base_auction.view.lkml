view: base_auction {
  sql_table_name: zinka.base_auction ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: dt_added {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_added ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: won_bid_id {
    type: number
    sql: ${TABLE}.won_bid_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
