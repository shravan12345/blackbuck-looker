view: enquiry_bid {
  sql_table_name: newbb.enquiry_bid ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: customer_status {
    type: number
    sql: ${TABLE}.customer_status ;;
  }

  dimension_group: dt_added {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.dt_added ;;
  }

  dimension_group: dt_updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.dt_updated ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active ;;
  }

  dimension: load {
    type: number
    sql: ${TABLE}.`load` ;;
  }

  dimension: load_unit {
    type: number
    sql: ${TABLE}.load_unit ;;
  }

  dimension: no_of_trucks {
    type: number
    sql: ${TABLE}.no_of_trucks ;;
  }

  dimension: order_request_id {
    type: number
    sql: ${TABLE}.order_request_id ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
  }

  dimension: supply_partner_id {
    type: number
    sql: ${TABLE}.supply_partner_id ;;
  }

  dimension: supply_partner_status {
    type: number
    sql: ${TABLE}.supply_partner_status ;;
  }

  dimension: type {
    type: number
    sql: ${TABLE}.type ;;
  }

  dimension: unit_price {
    type: number
    sql: ${TABLE}.unit_price ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
