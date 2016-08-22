- view: base_customerwallet
  sql_table_name: blackbuck_prod.base_customerwallet
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: balance
    type: number
    sql: ${TABLE}.balance

  - dimension: customer_id
    type: number
    sql: ${TABLE}.customer_id

  - measure: count
    type: count
    drill_fields: [id]

