view: base_coupon {
  sql_table_name: zinka.base_coupon ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension_group: end {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.end_date ;;
  }

  dimension: redeemed {
    type: yesno
    sql: ${TABLE}.redeemed ;;
  }

  dimension_group: redeemed {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.redeemed_date ;;
  }

  dimension_group: start {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.start_date ;;
  }

  dimension: type_of_coupon {
    type: number
    sql: ${TABLE}.type_of_coupon ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: valid {
    type: yesno
    sql: ${TABLE}.valid ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
