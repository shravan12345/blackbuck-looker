view: base_clusterconfig {
  sql_table_name: newbb.base_clusterconfig ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: auto_approve_limit {
    type: number
    sql: ${TABLE}.auto_approve_limit ;;
  }

  dimension: bid_percentage_lower {
    type: number
    sql: ${TABLE}.bid_percentage_lower ;;
  }

  dimension: bid_percentage_upper {
    type: number
    sql: ${TABLE}.bid_percentage_upper ;;
  }

  dimension: closing_time {
    type: string
    sql: ${TABLE}.closing_time ;;
  }

  dimension: cluster_id {
    type: number
    sql: ${TABLE}.cluster_id ;;
  }

  dimension: customer_advance {
    type: number
    sql: ${TABLE}.customer_advance ;;
  }

  dimension: customer_handshake {
    type: number
    sql: ${TABLE}.customer_handshake ;;
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

  dimension: hide_bidding_flag {
    type: yesno
    sql: ${TABLE}.hide_bidding_flag ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active ;;
  }

  dimension: max_commission {
    type: number
    sql: ${TABLE}.max_commission ;;
  }

  dimension: min_commission {
    type: number
    sql: ${TABLE}.min_commission ;;
  }

  dimension: opening_time {
    type: string
    sql: ${TABLE}.opening_time ;;
  }

  dimension: ops_assignment_time {
    type: number
    sql: ${TABLE}.ops_assignment_time ;;
  }

  dimension: payment_option {
    type: number
    sql: ${TABLE}.payment_option ;;
  }

  dimension: questionnaire_flag {
    type: yesno
    sql: ${TABLE}.questionnaire_flag ;;
  }

  dimension: request_expiry_time {
    type: number
    sql: ${TABLE}.request_expiry_time ;;
  }

  dimension: show_customer_quote_list {
    type: yesno
    sql: ${TABLE}.show_customer_quote_list ;;
  }

  dimension: show_customer_quote_order {
    type: yesno
    sql: ${TABLE}.show_customer_quote_order ;;
  }

  dimension: supplier_handshake {
    type: number
    sql: ${TABLE}.supplier_handshake ;;
  }

  dimension: time_to_order {
    type: number
    sql: ${TABLE}.time_to_order ;;
  }

  dimension: turn_around_time {
    type: number
    sql: ${TABLE}.turn_around_time ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
