- view: base_tollrate
  sql_table_name: blackbuck_prod.base_tollrate
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: rate
    type: number
    sql: ${TABLE}.rate

  - dimension: truck_type_id
    type: number
    sql: ${TABLE}.truck_type_id

  - measure: count
    type: count
    drill_fields: [id]

