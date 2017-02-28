view: django_session {
  sql_table_name: newbb.django_session ;;

  dimension_group: expire {
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
    sql: ${TABLE}.expire_date ;;
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
