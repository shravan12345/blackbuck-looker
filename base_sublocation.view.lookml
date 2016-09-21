- view: base_sublocation
  sql_table_name: zinka.base_sublocation
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: google_place_id
    type: number
    sql: ${TABLE}.google_place_id

  - dimension: location_id
    type: number
    sql: ${TABLE}.location_id

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - measure: count
    type: count
    drill_fields: [id, name]