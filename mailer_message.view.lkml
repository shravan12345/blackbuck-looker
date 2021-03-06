view: mailer_message {
  sql_table_name: zinka.mailer_message ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: message_data {
    type: string
    sql: ${TABLE}.message_data ;;
  }

  dimension: priority {
    type: string
    sql: ${TABLE}.priority ;;
  }

  dimension_group: when_added {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.when_added ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
