- view: base_lane
  sql_table_name: zinka.base_lane
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: destination1_id
    type: number
    sql: ${TABLE}.destination1_id

  - dimension: destination2_id
    type: number
    sql: ${TABLE}.destination2_id

  - measure: count
    type: count
    drill_fields: [id]