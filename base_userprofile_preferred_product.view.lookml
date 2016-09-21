- view: base_userprofile_preferred_product
  sql_table_name: zinka.base_userprofile_preferred_product
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: product_id
    type: number
    sql: ${TABLE}.product_id

  - dimension: userprofile_id
    type: number
    sql: ${TABLE}.userprofile_id

  - measure: count
    type: count
    drill_fields: [id]