- view: base_billdiscountingrepayment
  sql_table_name: zinka.base_billdiscountingrepayment
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: amount_credited
    type: number
    sql: ${TABLE}.amount_credited

  - dimension: bank_id
    type: number
    sql: ${TABLE}.bank_id

  - dimension: bill_discounting_id
    type: number
    sql: ${TABLE}.bill_discounting_id

  - dimension: created_by_id
    type: number
    sql: ${TABLE}.created_by_id

  - dimension: customer_id
    type: number
    sql: ${TABLE}.customer_id

  - dimension_group: dt_updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_updated

  - dimension: interest_rate
    type: number
    sql: ${TABLE}.interest_rate

  - dimension: loan_account_number
    type: string
    sql: ${TABLE}.loan_account_number

  - dimension: sanction_amount
    type: number
    sql: ${TABLE}.sanction_amount

  - dimension_group: sanction
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.sanction_date

  - measure: count
    type: count
    drill_fields: [id]