- view: base_mgperiodicpayment
  sql_table_name: zinka.base_mgperiodicpayment
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: amount
    type: number
    sql: ${TABLE}.amount

  - dimension: created_by_id
    type: number
    sql: ${TABLE}.created_by_id

  - dimension_group: dt_added
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_added

  - dimension_group: dt_updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_updated

  - dimension: status
    type: string
    sql: ${TABLE}.status

  - dimension: sub_contract_id
    type: number
    sql: ${TABLE}.sub_contract_id

  - dimension: supply_bank_id
    type: number
    sql: ${TABLE}.supply_bank_id

  - dimension: truck_id
    type: number
    sql: ${TABLE}.truck_id

  - dimension: updated_by_id
    type: number
    sql: ${TABLE}.updated_by_id

  - measure: count
    type: count
    drill_fields: [id]