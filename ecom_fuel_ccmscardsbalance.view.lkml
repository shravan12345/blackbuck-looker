view: ecom_fuel_ccmscardsbalance {
  sql_table_name: zinka.ecomFuel_ccmscardsbalance ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: card_number {
    type: string
    sql: ${TABLE}.card_number ;;
  }

  dimension: ccms_balance {
    type: number
    sql: ${TABLE}.ccms_balance ;;
  }

  dimension_group: dt_added {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_added ;;
  }

  dimension_group: dt_modified {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_modified ;;
  }

  dimension: fuelcard_id {
    type: number
    sql: ${TABLE}.fuelcard_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
