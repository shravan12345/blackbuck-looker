- view: external_apiauthentication
  sql_table_name: blackbuck_prod.external_apiauthentication
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: api_key
    type: string
    sql: ${TABLE}.api_key

  - dimension: customer_name
    type: string
    sql: ${TABLE}.customer_name

  - measure: count
    type: count
    drill_fields: [id, customer_name]

