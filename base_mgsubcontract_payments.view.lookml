- view: base_mgsubcontract_payments
  sql_table_name: blackbuck_prod.base_mgsubcontract_payments
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: financialtransaction_id
    type: number
    sql: ${TABLE}.financialtransaction_id

  - dimension: mgsubcontract_id
    type: number
    sql: ${TABLE}.mgsubcontract_id

  - measure: count
    type: count
    drill_fields: [id]

