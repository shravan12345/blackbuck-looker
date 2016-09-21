- view: base_lanecharacteristics
  sql_table_name: zinka.base_lanecharacteristics
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: avg_loading_time
    type: string
    sql: ${TABLE}.avg_loading_time

  - dimension: avg_unloading_time
    type: string
    sql: ${TABLE}.avg_unloading_time

  - dimension: from_location_id
    type: number
    sql: ${TABLE}.from_location_id

  - dimension: margin
    type: number
    sql: ${TABLE}.margin

  - dimension: payment_period
    type: number
    sql: ${TABLE}.payment_period

  - dimension: payment_spot
    type: number
    sql: ${TABLE}.payment_spot

  - dimension: req_transit_time
    type: string
    sql: ${TABLE}.req_transit_time

  - dimension: tendered_rate
    type: number
    sql: ${TABLE}.tendered_rate

  - dimension: to_location_id
    type: number
    sql: ${TABLE}.to_location_id

  - dimension: user_id
    type: number
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: [id]