- view: base_impstransaction
  sql_table_name: zinka.base_impstransaction
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: amount
    type: number
    sql: ${TABLE}.amount

  - dimension: bank_ref_num
    type: string
    sql: ${TABLE}.bank_ref_num

  - dimension_group: end
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.end_time

  - dimension: failure_reason
    type: number
    sql: ${TABLE}.failure_reason

  - dimension: fin_transaction_id
    type: number
    sql: ${TABLE}.fin_transaction_id

  - dimension: own_ref_num
    type: string
    sql: ${TABLE}.own_ref_num

  - dimension: request
    type: string
    sql: ${TABLE}.request

  - dimension: request_msg_code
    type: string
    sql: ${TABLE}.request_msg_code

  - dimension: response
    type: string
    sql: ${TABLE}.response

  - dimension: response_code
    type: string
    sql: ${TABLE}.response_code

  - dimension: response_status_msg
    type: string
    sql: ${TABLE}.response_status_msg

  - dimension: rrn
    type: string
    sql: ${TABLE}.rrn

  - dimension_group: start
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.start_time

  - dimension: state
    type: number
    sql: ${TABLE}.state

  - dimension: transaction_bank_id
    type: number
    sql: ${TABLE}.transaction_bank_id

  - measure: count
    type: count
    drill_fields: [id]