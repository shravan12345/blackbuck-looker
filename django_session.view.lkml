view: django_session {

  sql_table_name: zinka.django_session ;;

  dimension_group: expire {
    type: time
    timeframes: [time, date, week, month]

  }

  dimension: session_data {
    type: string
    sql: ${TABLE}.session_data ;;
  }

  dimension: session_key {
    type: string
    sql: ${TABLE}.session_key ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
