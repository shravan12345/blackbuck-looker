- view: base_fintranslock
  sql_table_name: zinka.base_fintranslock
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension_group: dt_added
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_added

  - dimension: model_id
    type: number
    sql: ${TABLE}.model_id

  - dimension: type_of_trans
    type: number
    sql: ${TABLE}.type_of_trans

  - dimension: user_id
    type: number
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: [id]