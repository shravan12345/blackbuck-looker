- view: mailer_dontsendentry
  sql_table_name: zinka.mailer_dontsendentry
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: to_address
    type: string
    sql: ${TABLE}.to_address

  - dimension_group: when_added
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.when_added

  - measure: count
    type: count
    drill_fields: [id]