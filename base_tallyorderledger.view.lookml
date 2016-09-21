- view: base_tallyorderledger
  sql_table_name: zinka.base_tallyorderledger
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: ledger_name
    type: string
    sql: ${TABLE}.ledger_name

  - dimension: order_id
    type: number
    sql: ${TABLE}.order_id

  - measure: count
    type: count
    drill_fields: [id, ledger_name]