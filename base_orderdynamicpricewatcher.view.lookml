- view: base_orderdynamicpricewatcher
  sql_table_name: zinka.base_orderdynamicpricewatcher
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: alarm_current_price
    type: number
    sql: ${TABLE}.alarm_current_price

  - dimension: alarm_price
    type: number
    sql: ${TABLE}.alarm_price

  - dimension: auto_watch
    type: yesno
    sql: ${TABLE}.auto_watch

  - dimension: customer_id
    type: number
    sql: ${TABLE}.customer_id

  - dimension: is_watch
    type: yesno
    sql: ${TABLE}.is_watch

  - dimension_group: last_watch
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_watch_time

  - dimension: order_dynamic_price_id
    type: number
    sql: ${TABLE}.order_dynamic_price_id

  - dimension_group: watch_start
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.watch_start_time

  - measure: count
    type: count
    drill_fields: [id]