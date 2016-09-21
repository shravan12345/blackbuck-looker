- view: base_paymentadvice
  sql_table_name: zinka.base_paymentadvice
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: customer_id
    type: number
    sql: ${TABLE}.customer_id

  - dimension: payment_advice_s3_url
    type: string
    sql: ${TABLE}.payment_advice_s3_url

  - dimension: uploaded_by_id
    type: number
    sql: ${TABLE}.uploaded_by_id

  - dimension_group: uploaded
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.uploaded_date

  - measure: count
    type: count
    drill_fields: [id]