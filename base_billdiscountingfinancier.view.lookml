- view: base_billdiscountingfinancier
  sql_table_name: blackbuck_prod.base_billdiscountingfinancier
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: address
    type: string
    sql: ${TABLE}.address

  - dimension: created_by_id
    type: number
    sql: ${TABLE}.created_by_id

  - dimension: credit_used
    type: number
    sql: ${TABLE}.credit_used

  - dimension_group: dt_added
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_added

  - dimension: escrow_account_number
    type: string
    sql: ${TABLE}.escrow_account_number

  - dimension: escrow_ifsc
    type: string
    sql: ${TABLE}.escrow_ifsc

  - dimension: financier
    type: string
    sql: ${TABLE}.financier

  - dimension: max_credit
    type: number
    sql: ${TABLE}.max_credit

  - dimension: min_credit
    type: number
    sql: ${TABLE}.min_credit

  - dimension: user_id
    type: number
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: [id]

