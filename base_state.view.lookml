- view: base_state
  sql_table_name: zinka.base_state
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: country_id
    type: number
    sql: ${TABLE}.country_id

  - dimension: google_place_id
    type: number
    sql: ${TABLE}.google_place_id

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - measure: count
    type: count
    drill_fields: [id, name]