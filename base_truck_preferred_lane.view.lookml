- view: base_truck_preferred_lane
  sql_table_name: zinka.base_truck_preferred_lane
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: lane_id
    type: number
    sql: ${TABLE}.lane_id

  - dimension: truck_id
    type: number
    sql: ${TABLE}.truck_id

  - measure: count
    type: count
    drill_fields: [id]