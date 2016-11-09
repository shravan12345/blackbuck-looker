view: base_receivablepayment {
  sql_table_name: zinka.base_receivablepayment ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: added_by_id {
    type: number
    sql: ${TABLE}.added_by_id ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: bank_id {
    type: number
    sql: ${TABLE}.bank_id ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension_group: dt_added {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_added ;;
  }

  dimension: financier_id {
    type: number
    sql: ${TABLE}.financier_id ;;
  }

  dimension: mode_of_payment {
    type: number
    sql: ${TABLE}.mode_of_payment ;;
  }

  dimension_group: received {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.received_date ;;
  }

  dimension: reference_number {
    type: string
    sql: ${TABLE}.reference_number ;;
  }

  dimension: repayment_id {
    type: number
    sql: ${TABLE}.repayment_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
