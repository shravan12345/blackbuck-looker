- view: base_paymentadviceerrors
  sql_table_name: zinka.base_paymentadviceerrors
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: error_line
    type: string
    sql: ${TABLE}.error_line

  - dimension: payment_advice_id
    type: number
    sql: ${TABLE}.payment_advice_id

  - measure: count
    type: count
    drill_fields: [id]