- view: base_fuelpartnertransaction
  sql_table_name: zinka.base_fuelpartnertransaction
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: amount
    type: number
    sql: ${TABLE}.amount

  - dimension: fin_transaction_id
    type: number
    sql: ${TABLE}.fin_transaction_id

  - dimension: fuel_partner_id
    type: number
    sql: ${TABLE}.fuel_partner_id

  - dimension: request
    type: string
    sql: ${TABLE}.request

  - dimension: response
    type: string
    sql: ${TABLE}.response

  - dimension: response_code
    type: string
    sql: ${TABLE}.response_code

  - measure: count
    type: count
    drill_fields: [id]