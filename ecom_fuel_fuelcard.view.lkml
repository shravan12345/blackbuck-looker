view: ecom_fuel_fuelcard {
  sql_table_name: zinka.ecomFuel_fuelcard ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: added_by_id {
    type: number
    sql: ${TABLE}.added_by_id ;;
  }

  dimension_group: added {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.added_date ;;
  }

  dimension: card_number {
    type: string
    sql: ${TABLE}.card_number ;;
  }

  dimension: card_type_id {
    type: number
    sql: ${TABLE}.card_type_id ;;
  }

  dimension: expiry_date {
    type: string
    sql: ${TABLE}.expiry_date ;;
  }

  dimension: fuel_card_provider_id {
    type: number
    sql: ${TABLE}.fuel_card_provider_id ;;
  }

  dimension: image_url {
    type: string
    sql: ${TABLE}.image_url ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active ;;
  }

  dimension: mobile_number {
    type: string
    sql: ${TABLE}.mobile_number ;;
  }

  dimension: owner_id {
    type: number
    sql: ${TABLE}.owner_id ;;
  }

  dimension: truck_number {
    type: string
    sql: ${TABLE}.truck_number ;;
  }

  dimension: verified {
    type: yesno
    sql: ${TABLE}.verified ;;
  }

  dimension: voucher_generated {
    type: string
    sql: ${TABLE}.voucher_generated ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
