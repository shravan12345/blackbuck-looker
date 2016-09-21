- view: base_googleplaces
  sql_table_name: zinka.base_googleplaces
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: address
    type: string
    sql: ${TABLE}.address

  - dimension: latitude
    type: number
    sql: ${TABLE}.latitude

  - dimension: longitude
    type: number
    sql: ${TABLE}.longitude

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - dimension: place_id
    type: string
    sql: ${TABLE}.place_id

  - dimension: types
    type: string
    sql: ${TABLE}.types

  - measure: count
    type: count
    drill_fields: [id, name]