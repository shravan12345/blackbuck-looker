view: base_warehouse {
  sql_table_name: zinka.base_warehouse ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension: address_not_available {
    type: yesno
    sql: ${TABLE}.address_not_available ;;
  }

  dimension: bill_exchange_reqd {
    type: yesno
    sql: ${TABLE}.bill_exchange_reqd ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: contact_name {
    type: string
    sql: ${TABLE}.contact_name ;;
  }

  dimension: contact_number {
    type: string
    sql: ${TABLE}.contact_number ;;
  }

  dimension: contacts {
    type: string
    sql: ${TABLE}.contacts ;;
  }

  dimension: custom_requirements {
    type: string
    sql: ${TABLE}.custom_requirements ;;
  }

  dimension: customer_code {
    type: string
    sql: ${TABLE}.customer_code ;;
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  dimension: customer_loc_name {
    type: string
    sql: ${TABLE}.customer_loc_name ;;
  }

  dimension: customer_name {
    type: string
    sql: ${TABLE}.customer_name ;;
  }

  dimension: cutoff_duration {
    type: number
    sql: ${TABLE}.cutoff_duration ;;
  }

  dimension: detention_charges {
    type: string
    sql: ${TABLE}.detention_charges ;;
  }

  dimension: doors_open {
    type: yesno
    sql: ${TABLE}.doors_open ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active ;;
  }

  dimension: is_intracity {
    type: yesno
    sql: ${TABLE}.is_intracity ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: loading_tat {
    type: number
    sql: ${TABLE}.loading_tat ;;
  }

  dimension: location_type {
    type: string
    sql: ${TABLE}.location_type ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: material_mvmt_type {
    type: number
    sql: ${TABLE}.material_mvmt_type ;;
  }

  dimension: mobile_allowed {
    type: yesno
    sql: ${TABLE}.mobile_allowed ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: optimized_loading {
    type: yesno
    sql: ${TABLE}.optimized_loading ;;
  }

  dimension: overheight {
    type: yesno
    sql: ${TABLE}.overheight ;;
  }

  dimension_group: reporting {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.reporting_time ;;
  }

  dimension: shipment_type {
    type: number
    sql: ${TABLE}.shipment_type ;;
  }

  dimension: sublocation_id {
    type: number
    sql: ${TABLE}.sublocation_id ;;
  }

  dimension: supervisor_name {
    type: string
    sql: ${TABLE}.supervisor_name ;;
  }

  dimension: supervisor_number {
    type: string
    sql: ${TABLE}.supervisor_number ;;
  }

  dimension: timings {
    type: string
    sql: ${TABLE}.timings ;;
  }

  dimension: to_pay_model {
    type: yesno
    sql: ${TABLE}.to_pay_model ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: unloading_tat {
    type: number
    sql: ${TABLE}.unloading_tat ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [id, name, customer_name, contact_name, customer_loc_name, supervisor_name]
  }
}
