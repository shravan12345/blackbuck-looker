view: base_deductions {
  sql_table_name: zinka.base_deductions ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: amt_deducted {
    type: number
    sql: ${TABLE}.amt_deducted ;;
  }

  dimension: deduction_reason {
    type: string
    sql: ${TABLE}.deduction_reason ;;
  }

  dimension: lr_number {
    type: string
    sql: ${TABLE}.lr_number ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: payment_advice_id {
    type: number
    sql: ${TABLE}.payment_advice_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
