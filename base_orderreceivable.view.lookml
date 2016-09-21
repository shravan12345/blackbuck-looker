- view: base_orderreceivable
  sql_table_name: zinka.base_orderreceivable
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: amount
    type: number
    sql: ${TABLE}.amount

  - dimension: order_id
    type: number
    sql: ${TABLE}.order_id

  - dimension: receivable_payment_id
    type: number
    sql: ${TABLE}.receivable_payment_id

  - dimension: receivable_reason
    type: number
    sql: ${TABLE}.receivable_reason

  - measure: count
    type: count
    drill_fields: [id]