- view: base_mgtruckcontractdetail
  sql_table_name: blackbuck_prod.base_mgtruckcontractdetail
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: contract_id
    type: number
    sql: ${TABLE}.contract_id

  - dimension_group: end
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.end_date

  - dimension: payment_type
    type: number
    sql: ${TABLE}.payment_type

  - dimension_group: start
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.start_date

  - measure: count
    type: count
    drill_fields: [id]

