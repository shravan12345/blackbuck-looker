- view: base_dieselhikerelatednotification
  sql_table_name: zinka.base_dieselhikerelatednotification
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: customer_id
    type: number
    sql: ${TABLE}.customer_id

  - dimension: file_url
    type: string
    sql: ${TABLE}.file_url

  - measure: count
    type: count
    drill_fields: [id]