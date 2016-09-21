- view: mailer_messagelog
  sql_table_name: zinka.mailer_messagelog
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: log_message
    type: string
    sql: ${TABLE}.log_message

  - dimension: message_data
    type: string
    sql: ${TABLE}.message_data

  - dimension: priority
    type: string
    sql: ${TABLE}.priority

  - dimension: result
    type: string
    sql: ${TABLE}.result

  - dimension_group: when_added
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.when_added

  - dimension_group: when_attempted
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.when_attempted

  - measure: count
    type: count
    drill_fields: [id]