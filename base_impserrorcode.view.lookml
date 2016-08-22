- view: base_impserrorcode
  sql_table_name: blackbuck_prod.base_impserrorcode
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: action
    type: number
    sql: ${TABLE}.action

  - dimension: error_code
    type: string
    sql: ${TABLE}.error_code

  - dimension: error_description
    type: string
    sql: ${TABLE}.error_description

  - dimension: transaction_bank_id
    type: number
    sql: ${TABLE}.transaction_bank_id

  - measure: count
    type: count
    drill_fields: [id]

