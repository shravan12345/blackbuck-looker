- view: base_tallypayment
  sql_table_name: blackbuck_prod.base_tallypayment
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: amount
    type: number
    sql: ${TABLE}.amount

  - dimension_group: dt_added
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_added

  - dimension: imps_transaction_id
    type: number
    sql: ${TABLE}.imps_transaction_id

  - dimension: urn
    type: string
    sql: ${TABLE}.urn

  - dimension: uuid
    type: string
    sql: ${TABLE}.uuid

  - measure: count
    type: count
    drill_fields: [id]

