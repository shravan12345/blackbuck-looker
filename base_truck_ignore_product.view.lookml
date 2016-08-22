- view: base_truck_ignore_product
  sql_table_name: blackbuck_prod.base_truck_ignore_product
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

