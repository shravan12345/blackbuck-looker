- view: base_ftreasonmapping
  sql_table_name: blackbuck_prod.base_ftreasonmapping
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: fin_transaction_id
    type: number
    sql: ${TABLE}.fin_transaction_id

  - dimension: order_id
    type: number
    sql: ${TABLE}.order_id

  - dimension: owner_referral_id
    type: number
    sql: ${TABLE}.owner_referral_id

  - measure: count
    type: count
    drill_fields: [id]

