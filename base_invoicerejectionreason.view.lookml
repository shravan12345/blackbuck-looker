- view: base_invoicerejectionreason
  sql_table_name: zinka.base_invoicerejectionreason
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: freight_bill_number
    type: string
    sql: ${TABLE}.freight_bill_number

  - dimension: reason
    type: string
    sql: ${TABLE}.reason

  - dimension: rejected_by_id
    type: number
    sql: ${TABLE}.rejected_by_id

  - dimension_group: rejection
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.rejection_date

  - measure: count
    type: count
    drill_fields: [id]