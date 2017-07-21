view: ecom_fuel_ccmsparentcard {
  sql_table_name: zinka.ecomFuel_ccmsparentcard ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: actual_ccms_balance {
    type: number
    sql: ${TABLE}.actual_ccms_balance ;;
  }

  dimension: cash_balance {
    type: number
    sql: ${TABLE}.cash_balance ;;
  }

  dimension: ccms_balance {
    type: number
    sql: ${TABLE}.ccms_balance ;;
  }

  dimension_group: created {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at ;;
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  dimension_group: modifed {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.modifed_at ;;
  }

  dimension: xtra_point {
    type: number
    sql: ${TABLE}.xtra_point ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
