- view: base_botcallqueue
  sql_table_name: blackbuck_prod.base_botcallqueue
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension_group: dt_added
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_added

  - dimension: order_id
    type: number
    sql: ${TABLE}.order_id

  - dimension_group: scheduled
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.scheduled_time

  - measure: count
    type: count
    drill_fields: [id]

