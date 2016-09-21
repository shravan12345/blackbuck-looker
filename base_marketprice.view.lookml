- view: base_marketprice
  sql_table_name: zinka.base_marketprice
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: lane_id
    type: number
    sql: ${TABLE}.lane_id

  - dimension: market_price
    type: number
    sql: ${TABLE}.market_price

  - dimension_group: price
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.price_date

  - dimension: tonnage_id
    type: number
    sql: ${TABLE}.tonnage_id

  - measure: count
    type: count
    drill_fields: [id]