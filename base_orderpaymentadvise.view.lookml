- view: base_orderpaymentadvise
  sql_table_name: zinka.base_orderpaymentadvise
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

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

  - dimension_group: dt_received
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_received

  - dimension_group: dt_updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_updated

  - dimension: order_id
    type: number
    sql: ${TABLE}.order_id

  - dimension: receivable_amount
    type: number
    sql: ${TABLE}.receivable_amount

  - dimension: updated_by_id
    type: number
    sql: ${TABLE}.updated_by_id

  - measure: count
    type: count
    drill_fields: [id]