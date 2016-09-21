- view: base_placementdata
  sql_table_name: zinka.base_placementdata
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension_group: date
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date

  - dimension: today_orders
    type: number
    sql: ${TABLE}.today_orders

  - dimension: today_placed_orders
    type: number
    sql: ${TABLE}.today_placed_orders

  - dimension: total_placed_orders
    type: number
    sql: ${TABLE}.total_placed_orders

  - dimension: user_id
    type: number
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: [id]