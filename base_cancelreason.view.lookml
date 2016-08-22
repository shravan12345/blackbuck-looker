- view: base_cancelreason
  sql_table_name: blackbuck_prod.base_cancelreason
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: mark_by_customer
    type: yesno
    sql: ${TABLE}.mark_by_customer

  - dimension: reason
    type: string
    sql: ${TABLE}.reason

  - measure: count
    type: count
    drill_fields: [id]

