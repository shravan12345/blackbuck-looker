- view: base_incentivelanes
  sql_table_name: zinka.base_incentivelanes
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: from_city_id
    type: number
    sql: ${TABLE}.from_city_id

  - dimension: to_city_id
    type: number
    sql: ${TABLE}.to_city_id

  - measure: count
    type: count
    drill_fields: [id]