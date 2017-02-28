view: base_billdiscountinghistory {
  sql_table_name: zinka.base_billdiscountinghistory ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: amount_credited {
    type: number
    sql: ${TABLE}.amount_credited ;;
  }

  dimension: amount_received {
    type: number
    sql: ${TABLE}.amount_received ;;
  }

  dimension: cover_letter_url {
    type: string
    sql: ${TABLE}.cover_letter_url ;;
  }

  dimension: created_by_id {
    type: number
    sql: ${TABLE}.created_by_id ;;
  }

  dimension_group: dt_added {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_added ;;
  }

  dimension: financier_id {
    type: number
    sql: ${TABLE}.financier_id ;;
  }

  dimension_group: received {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.received_date ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
