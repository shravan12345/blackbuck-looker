view: ecom_fuel_cardrequest {
  sql_table_name: zinka.ecomFuel_cardrequest ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension: card_number_id {
    type: number
    sql: ${TABLE}.card_number_id ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension_group: dt_added {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_added ;;
  }

  dimension: extra_remarks {
    type: string
    sql: ${TABLE}.extra_remarks ;;
  }

  dimension: fuel_card_provider_id {
    type: number
    sql: ${TABLE}.fuel_card_provider_id ;;
  }

  dimension: image_url {
    type: string
    sql: ${TABLE}.image_url ;;
  }

  dimension: mobile_number {
    type: string
    sql: ${TABLE}.mobile_number ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: owner_id {
    type: number
    sql: ${TABLE}.owner_id ;;
  }

  dimension: pin_code {
    type: string
    sql: ${TABLE}.pin_code ;;
  }

  dimension: reject_remark_status {
    type: number
    sql: ${TABLE}.reject_remark_status ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
