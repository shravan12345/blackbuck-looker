view: enquiry_order {
  sql_table_name: newbb.enquiry_order ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: bid_id {
    type: number
    sql: ${TABLE}.bid_id ;;
  }

  dimension: cancel_reason {
    type: number
    sql: ${TABLE}.cancel_reason ;;
  }

  dimension: cancel_remarks {
    type: string
    sql: ${TABLE}.cancel_remarks ;;
  }

  dimension: comments {
    type: string
    sql: ${TABLE}.comments ;;
  }

  dimension: customer_quote {
    type: number
    sql: ${TABLE}.customer_quote ;;
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

  dimension: order_request_id {
    type: number
    sql: ${TABLE}.order_request_id ;;
  }

  dimension: remarks {
    type: number
    sql: ${TABLE}.remarks ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
  }

  dimension: supply_partner_status {
    type: number
    sql: ${TABLE}.supply_partner_status ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
