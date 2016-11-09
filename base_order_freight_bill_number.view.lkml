view: base_order_freight_bill_number {
  sql_table_name: zinka.base_order_freight_bill_number ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: customerinvoice_id {
    type: number
    sql: ${TABLE}.customerinvoice_id ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
