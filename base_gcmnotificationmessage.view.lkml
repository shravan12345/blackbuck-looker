view: base_gcmnotificationmessage {
  sql_table_name: zinka.base_gcmnotificationmessage ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: dt_added {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_added ;;
  }

  dimension: message {
    type: string
    sql: ${TABLE}.message ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
