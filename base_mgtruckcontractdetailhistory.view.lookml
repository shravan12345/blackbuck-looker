- view: base_mgtruckcontractdetailhistory
  sql_table_name: blackbuck_prod.base_mgtruckcontractdetailhistory
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: created_by_id
    type: number
    sql: ${TABLE}.created_by_id

  - dimension_group: dt_added
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_added

  - dimension_group: end
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.end_date

  - dimension: mgtruckcontractdetail_id
    type: number
    sql: ${TABLE}.mgtruckcontractdetail_id

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

