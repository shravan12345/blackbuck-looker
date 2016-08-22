- view: base_laneroaddetails
  sql_table_name: blackbuck_prod.base_laneroaddetails
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: distance
    type: number
    sql: ${TABLE}.distance

  - dimension: lane_id
    type: number
    sql: ${TABLE}.lane_id

  - measure: count
    type: count
    drill_fields: [id]

