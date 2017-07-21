view: enquiry_orderrequest {
  sql_table_name: newbb.enquiry_orderrequest ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: assignee_id {
    type: number
    sql: ${TABLE}.assignee_id ;;
  }

  dimension: cluster_id {
    type: number
    sql: ${TABLE}.cluster_id ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
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

  dimension_group: dt_sla_ends {
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
    sql: ${TABLE}.dt_sla_ends ;;
  }

  dimension_group: dt_truck_placement {
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
    sql: ${TABLE}.dt_truck_placement ;;
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

  dimension: lane_id {
    type: number
    sql: ${TABLE}.lane_id ;;
  }

  dimension: load {
    type: number
    sql: ${TABLE}.`load` ;;
  }

  dimension: load_booked {
    type: number
    sql: ${TABLE}.load_booked ;;
  }

  dimension: load_unit {
    type: number
    sql: ${TABLE}.load_unit ;;
  }

  dimension: multiple_loading_unloading {
    type: yesno
    sql: ${TABLE}.multiple_loading_unloading ;;
  }

  dimension: payment_option {
    type: number
    sql: ${TABLE}.payment_option ;;
  }

  dimension: product {
    type: string
    sql: ${TABLE}.product ;;
  }

  dimension: remarks {
    type: number
    sql: ${TABLE}.remarks ;;
  }

  dimension: specific_payment_option {
    type: number
    sql: ${TABLE}.specific_payment_option ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
  }

  dimension: truck_body {
    type: number
    sql: ${TABLE}.truck_body ;;
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
