view: base_orderpaneltypayment {
  sql_table_name: zinka.base_orderpaneltypayment ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
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

  dimension: financial_transaction_id {
    type: number
    sql: ${TABLE}.financial_transaction_id ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: penalty_id {
    type: number
    sql: ${TABLE}.penalty_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
