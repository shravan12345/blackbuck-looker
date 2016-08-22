- view: base_orderdynamicpricewatcherstatus
  sql_table_name: blackbuck_prod.base_orderdynamicpricewatcherstatus
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

  - dimension_group: end
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.end_time

  - dimension: is_watch
    type: yesno
    sql: ${TABLE}.is_watch

  - dimension: order_dynamic_price_watcher_id
    type: number
    sql: ${TABLE}.order_dynamic_price_watcher_id

  - dimension_group: start
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.start_time

  - measure: count
    type: count
    drill_fields: [id]

