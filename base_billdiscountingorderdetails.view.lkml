view: base_billdiscountingorderdetails {
  sql_table_name: zinka.base_billdiscountingorderdetails ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: bill_discount_inv_url {
    type: string
    sql: ${TABLE}.bill_discount_inv_url ;;
  }

  dimension: bill_discounting_id {
    type: number
    sql: ${TABLE}.bill_discounting_id ;;
  }

  dimension: bill_num {
    type: string
    sql: ${TABLE}.bill_num ;;
  }

  dimension_group: invoice {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.invoice_date ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: receivable {
    type: number
    sql: ${TABLE}.receivable ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
