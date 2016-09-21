- view: base_truck_preferred_product
  sql_table_name: zinka.base_truck_preferred_product
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: product_id
    type: number
    sql: ${TABLE}.product_id

  - dimension: truck_id
    type: number
    sql: ${TABLE}.truck_id

  - measure: count
    type: count
    drill_fields: [id]