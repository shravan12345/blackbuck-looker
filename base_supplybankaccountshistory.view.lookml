- view: base_supplybankaccountshistory
  sql_table_name: zinka.base_supplybankaccountshistory
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: added_by_id
    type: number
    sql: ${TABLE}.added_by_id

  - dimension_group: end
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.end_time

  - dimension: source
    type: number
    sql: ${TABLE}.source

  - dimension_group: start
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.start_time

  - dimension: state
    type: number
    sql: ${TABLE}.state

  - dimension: supply_partner_account_id
    type: number
    sql: ${TABLE}.supply_partner_account_id

  - measure: count
    type: count
    drill_fields: [id]