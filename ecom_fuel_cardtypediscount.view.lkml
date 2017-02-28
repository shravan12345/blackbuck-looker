view: ecom_fuel_cardtypediscount {
  sql_table_name: zinka.ecomFuel_cardtypediscount ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: added {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.added_date ;;
  }

  dimension: card_type_id {
    type: number
    sql: ${TABLE}.card_type_id ;;
  }

  dimension: discount_percentage {
    type: number
    sql: ${TABLE}.discount_percentage ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
