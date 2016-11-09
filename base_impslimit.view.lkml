view: base_impslimit {
  sql_table_name: zinka.base_impslimit ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: bank_blocked_id {
    type: number
    sql: ${TABLE}.bank_blocked_id ;;
  }

  dimension: breached_limit {
    type: number
    sql: ${TABLE}.breached_limit ;;
  }

  dimension_group: dt_of_limit_crossing {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_of_limit_crossing ;;
  }

  dimension_group: dt_of_otp_verification {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_of_otp_verification ;;
  }

  dimension: otp {
    type: string
    sql: ${TABLE}.otp ;;
  }

  dimension: otp_verified {
    type: yesno
    sql: ${TABLE}.otp_verified ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
