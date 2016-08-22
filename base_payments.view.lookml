- view: base_payments
  sql_table_name: blackbuck_prod.base_payments
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: billed_amt
    type: number
    sql: ${TABLE}.billed_amt

  - dimension: lr_number
    type: string
    sql: ${TABLE}.lr_number

  - dimension: order_id
    type: number
    sql: ${TABLE}.order_id

  - dimension: payment_advice_id
    type: number
    sql: ${TABLE}.payment_advice_id

  - measure: count
    type: count
    drill_fields: [id]

