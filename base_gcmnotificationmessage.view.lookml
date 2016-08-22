- view: base_gcmnotificationmessage
  sql_table_name: blackbuck_prod.base_gcmnotificationmessage
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension_group: dt_added
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_added

  - dimension: message
    type: string
    sql: ${TABLE}.message

  - dimension: user_id
    type: number
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: [id]

