- view: base_warehouselane
  sql_table_name: blackbuck_prod.base_warehouselane
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: from_warehouse_id
    type: number
    sql: ${TABLE}.from_warehouse_id

  - dimension: to_warehouse_id
    type: number
    sql: ${TABLE}.to_warehouse_id

  - measure: count
    type: count
    drill_fields: [id]

