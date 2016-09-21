- view: base_botdailyorderdetails
  sql_table_name: zinka.base_botdailyorderdetails
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension_group: bot_call_day
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.bot_call_day

  - dimension_group: dt_added
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_added

  - dimension_group: dt_updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_updated

  - dimension_group: last_bot_call_update
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_bot_call_update_time

  - dimension: last_bot_call_update_type
    type: number
    sql: ${TABLE}.last_bot_call_update_type

  - dimension_group: last_successful_attempt
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_successful_attempt

  - dimension_group: last_successful_portal_update
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_successful_portal_update

  - dimension: make_bot_call
    type: yesno
    sql: ${TABLE}.make_bot_call

  - dimension: order_id
    type: number
    sql: ${TABLE}.order_id

  - dimension: successful_attempt_count
    type: number
    sql: ${TABLE}.successful_attempt_count

  - dimension: unsuccessful_attempt_count
    type: number
    sql: ${TABLE}.unsuccessful_attempt_count

  - measure: count
    type: count
    drill_fields: [id]