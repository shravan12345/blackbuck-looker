- view: base_trucklanerate
  sql_table_name: zinka.base_trucklanerate
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension_group: end
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.end_time

  - dimension: from_city_id
    type: number
    sql: ${TABLE}.from_city_id

  - dimension: lane_id
    type: number
    sql: ${TABLE}.lane_id

  - dimension: loading_charge
    type: number
    sql: ${TABLE}.loading_charge

  - dimension: rate
    type: number
    sql: ${TABLE}.rate

  - dimension_group: start
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.start_time

  - dimension: to_city_id
    type: number
    sql: ${TABLE}.to_city_id

  - dimension: truck_type_id
    type: number
    sql: ${TABLE}.truck_type_id

  - dimension: unloading_charge
    type: number
    sql: ${TABLE}.unloading_charge

  - measure: count
    type: count
    drill_fields: [id]