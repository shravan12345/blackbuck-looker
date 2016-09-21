- view: base_billdiscountingpayments
  sql_table_name: zinka.base_billdiscountingpayments
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: amount
    type: number
    sql: ${TABLE}.amount

  - dimension: bank_id
    type: number
    sql: ${TABLE}.bank_id

  - dimension: created_by_id
    type: number
    sql: ${TABLE}.created_by_id

  - dimension: customer_id
    type: number
    sql: ${TABLE}.customer_id

  - dimension_group: dt_added
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_added

  - dimension: financier_id
    type: number
    sql: ${TABLE}.financier_id

  - dimension: interest_amount
    type: number
    sql: ${TABLE}.interest_amount

  - dimension_group: interest
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.interest_date

  - dimension: payment_type
    type: number
    sql: ${TABLE}.payment_type

  - dimension_group: received
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.received_date

  - dimension: reference_number
    type: string
    sql: ${TABLE}.reference_number

  - dimension: repayment_id
    type: number
    sql: ${TABLE}.repayment_id

  - measure: count
    type: count
    drill_fields: [id]