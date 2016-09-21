- view: base_tonnage
  sql_table_name: zinka.base_tonnage
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: tonnage
    type: number
    sql: ${TABLE}.tonnage

  - measure: count
    type: count
    drill_fields: [id]