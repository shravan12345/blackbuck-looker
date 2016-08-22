- view: base_truckownerreferral
  sql_table_name: blackbuck_prod.base_truckownerreferral
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: amount
    type: number
    sql: ${TABLE}.amount

  - dimension: amount_paid_status
    type: number
    sql: ${TABLE}.amount_paid_status

  - dimension: lead_id
    type: number
    sql: ${TABLE}.lead_id

  - measure: count
    type: count
    drill_fields: [id]

