- view: base_impsbank
  sql_table_name: zinka.base_impsbank
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: bank
    type: string
    sql: ${TABLE}.bank

  - dimension: otp
    type: string
    sql: ${TABLE}.otp

  - dimension: state
    type: number
    sql: ${TABLE}.state

  - dimension: tally_ledger_name
    type: string
    sql: ${TABLE}.tally_ledger_name

  - measure: count
    type: count
    drill_fields: [id, tally_ledger_name]