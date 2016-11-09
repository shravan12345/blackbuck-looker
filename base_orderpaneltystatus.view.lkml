view: base_orderpaneltystatus {
  sql_table_name: zinka.base_orderpaneltystatus ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: comment {
    type: string
    sql: ${TABLE}.comment ;;
  }

  dimension: created_by_id {
    type: number
    sql: ${TABLE}.created_by_id ;;
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

  dimension: penalty_id {
    type: number
    sql: ${TABLE}.penalty_id ;;
  }

  dimension: resubmit_reason {
    type: string
    sql: ${TABLE}.resubmit_reason ;;
  }

  dimension: state {
    type: number
    sql: ${TABLE}.state ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
