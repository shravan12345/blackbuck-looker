view: base_lorryreceipt {
  sql_table_name: zinka.base_lorryreceipt ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: cn {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.cn_date ;;
  }

  dimension: created_by_id {
    type: number
    sql: ${TABLE}.created_by_id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_date ;;
  }

  dimension: cst_number {
    type: string
    sql: ${TABLE}.cst_number ;;
  }

  dimension: from_city {
    type: string
    sql: ${TABLE}.from_city ;;
  }

  dimension: from_state {
    type: string
    sql: ${TABLE}.from_state ;;
  }

  dimension: invoice_number {
    type: string
    sql: ${TABLE}.invoice_number ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension_group: last_modified {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension_group: lr {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.lr_date ;;
  }

  dimension: lr_details {
    type: string
    sql: ${TABLE}.lr_details ;;
  }

  dimension: lr_number {
    type: string
    sql: ${TABLE}.lr_number ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: to_city {
    type: string
    sql: ${TABLE}.to_city ;;
  }

  dimension: to_state {
    type: string
    sql: ${TABLE}.to_state ;;
  }

  dimension: vat_number {
    type: string
    sql: ${TABLE}.vat_number ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
