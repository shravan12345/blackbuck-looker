view: enquiry_ordermargin {
  sql_table_name: newbb.enquiry_ordermargin ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: actual_collection_amount {
    type: number
    sql: ${TABLE}.actual_collection_amount ;;
  }

  dimension: actual_seller_amount {
    type: number
    sql: ${TABLE}.actual_seller_amount ;;
  }

  dimension: advance_receivable {
    type: number
    sql: ${TABLE}.advance_receivable ;;
  }

  dimension: advance_received {
    type: yesno
    sql: ${TABLE}.advance_received ;;
  }

  dimension: collection_amount {
    type: number
    sql: ${TABLE}.collection_amount ;;
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

  dimension: fs_receivable {
    type: number
    sql: ${TABLE}.fs_receivable ;;
  }

  dimension: fs_received {
    type: yesno
    sql: ${TABLE}.fs_received ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active ;;
  }

  dimension: margin {
    type: number
    sql: ${TABLE}.margin ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: seller_amount {
    type: number
    sql: ${TABLE}.seller_amount ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
