- view: base_incentivecoupon
  sql_table_name: blackbuck_prod.base_incentivecoupon
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: amount
    type: number
    sql: ${TABLE}.amount

  - dimension: beneficiary_id
    type: number
    sql: ${TABLE}.beneficiary_id

  - dimension: code
    type: string
    sql: ${TABLE}.code

  - dimension_group: expiry
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.expiry_date

  - dimension: fin_transaction_id
    type: number
    sql: ${TABLE}.finTransaction_id

  - dimension: is_redeemed
    type: yesno
    sql: ${TABLE}.is_redeemed

  - dimension_group: issue
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.issue_date

  - dimension: order_id
    type: number
    sql: ${TABLE}.order_id

  - dimension: payment_status
    type: number
    sql: ${TABLE}.payment_status

  - dimension: query_string
    type: string
    sql: ${TABLE}.query_string

  - dimension_group: redeem
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.redeem_date

  - dimension: redeemed_by_id
    type: number
    sql: ${TABLE}.redeemed_by_id

  - measure: count
    type: count
    drill_fields: [id]

