view: ecom_fuel_bpclfuelvouchers {
  sql_table_name: zinka.ecomFuel_bpclfuelvouchers ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: api_scheme_id {
    type: number
    sql: ${TABLE}.api_scheme_id ;;
  }

  dimension: denomination_value {
    type: number
    sql: ${TABLE}.denomination_value ;;
  }

  dimension: face_value {
    type: number
    sql: ${TABLE}.face_value ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active ;;
  }

  dimension: payment_mode {
    type: number
    sql: ${TABLE}.payment_mode ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
