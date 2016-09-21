- view: base_customermasterraterevision
  sql_table_name: zinka.base_customermasterraterevision
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: change_percentage
    type: number
    sql: ${TABLE}.change_percentage

  - dimension: created_by_id
    type: number
    sql: ${TABLE}.created_by_id

  - dimension: customer_id
    type: number
    sql: ${TABLE}.customer_id

  - dimension_group: end
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.end_time

  - dimension: rate_change_type
    type: number
    sql: ${TABLE}.rate_change_type

  - dimension_group: start
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.start_time

  - measure: count
    type: count
    drill_fields: [id]