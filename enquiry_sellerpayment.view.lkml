view: enquiry_sellerpayment {
  sql_table_name: newbb.enquiry_sellerpayment ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: advance_liability {
    type: number
    sql: ${TABLE}.advance_liability ;;
  }

  dimension: advance_released {
    type: yesno
    sql: ${TABLE}.advance_released ;;
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

  dimension: fs_liability {
    type: number
    sql: ${TABLE}.fs_liability ;;
  }

  dimension: fs_released {
    type: yesno
    sql: ${TABLE}.fs_released ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active ;;
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
