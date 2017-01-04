view: ecom_fuel_bpclcardsbalance {
  sql_table_name: zinka.ecomFuel_bpclcardsbalance ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: bpcl_card_balance {
    type: number
    sql: ${TABLE}.bpcl_card_balance ;;
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
