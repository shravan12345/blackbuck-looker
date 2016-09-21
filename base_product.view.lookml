- view: base_product
  sql_table_name: zinka.base_product
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: is_intracity
    type: yesno
    sql: ${TABLE}.is_intracity

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - dimension: product_type
    type: string
    sql: ${TABLE}.product_type

  - measure: count
    type: count
    drill_fields: [id, name]