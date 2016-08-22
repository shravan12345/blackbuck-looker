- view: base_bottracktrace
  sql_table_name: blackbuck_prod.base_bottracktrace
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension_group: bot_call_update
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.bot_call_update_time

  - dimension: bot_call_update_type
    type: number
    sql: ${TABLE}.bot_call_update_type

  - dimension: bot_url
    type: string
    sql: ${TABLE}.bot_url

  - dimension: call_attempted
    type: yesno
    sql: ${TABLE}.call_attempted

  - dimension: chatterbox_status
    type: string
    sql: ${TABLE}.chatterbox_status

  - dimension_group: dt_added
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_added

  - dimension_group: dt_updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_updated

  - dimension: order_id
    type: number
    sql: ${TABLE}.order_id

  - dimension_group: portal_update
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.portal_update

  - dimension: status
    type: number
    sql: ${TABLE}.status

  - dimension_group: successful_attempt
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.successful_attempt_time

  - dimension: unique_id
    type: string
    sql: ${TABLE}.unique_id

  - measure: count
    type: count
    drill_fields: [id]

