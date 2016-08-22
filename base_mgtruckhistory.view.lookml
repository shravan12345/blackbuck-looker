- view: base_mgtruckhistory
  sql_table_name: blackbuck_prod.base_mgtruckhistory
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

  - dimension: mg_amount
    type: number
    sql: ${TABLE}.mg_amount

  - dimension: mg_cost_perkm
    type: number
    sql: ${TABLE}.mg_cost_perkm

  - dimension: mg_distance
    type: number
    sql: ${TABLE}.mg_distance

  - dimension: mg_truck_id
    type: number
    sql: ${TABLE}.mg_truck_id

  - dimension_group: start
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.start_date

  - measure: count
    type: count
    drill_fields: [id]

