- view: base_customerloadunloadpointsrates
  sql_table_name: blackbuck_prod.base_customerloadunloadpointsrates
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: customer_id
    type: number
    sql: ${TABLE}.customer_id

  - dimension_group: end
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.end_time

  - dimension_group: last_updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated_at

  - dimension: last_updated_by_id
    type: number
    sql: ${TABLE}.last_updated_by_id

  - dimension: loading_pt_rate
    type: number
    sql: ${TABLE}.loading_pt_rate

  - dimension: location_id
    type: number
    sql: ${TABLE}.location_id

  - dimension: num_loading_points
    type: number
    sql: ${TABLE}.num_loading_points

  - dimension: num_unloading_points
    type: number
    sql: ${TABLE}.num_unloading_points

  - dimension_group: start
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.start_time

  - dimension: truck_type_id
    type: number
    sql: ${TABLE}.truck_type_id

  - dimension: unloading_pt_rate
    type: number
    sql: ${TABLE}.unloading_pt_rate

  - dimension: warehouse_id
    type: number
    sql: ${TABLE}.warehouse_id

  - measure: count
    type: count
    drill_fields: [id]

