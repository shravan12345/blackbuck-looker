- view: base_distance
  sql_table_name: blackbuck_prod.base_distance
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: distance
    type: number
    sql: ${TABLE}.distance

  - dimension: from_latitude
    type: number
    sql: ${TABLE}.from_latitude

  - dimension: from_longitude
    type: number
    sql: ${TABLE}.from_longitude

  - dimension: to_latitude
    type: number
    sql: ${TABLE}.to_latitude

  - dimension: to_longitude
    type: number
    sql: ${TABLE}.to_longitude

  - measure: count
    type: count
    drill_fields: [id]

