- view: base_payment
  sql_table_name: blackbuck_prod.base_payment
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

  - dimension_group: dt_updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_updated

  - dimension: order_id
    type: number
    sql: ${TABLE}.order_id

  - dimension: status
    type: string
    sql: ${TABLE}.status

  - dimension: user_id
    type: number
    sql: ${TABLE}.user_id

  - dimension: user_type
    type: string
    sql: ${TABLE}.user_type

  - measure: count
    type: count
    drill_fields: [id]

