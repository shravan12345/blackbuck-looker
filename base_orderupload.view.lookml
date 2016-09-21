- view: base_orderupload
  sql_table_name: zinka.base_orderupload
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension_group: dt_added
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_added

  - dimension: file
    type: string
    sql: ${TABLE}.file

  - dimension: is_intracity
    type: yesno
    sql: ${TABLE}.is_intracity

  - dimension: status
    type: string
    sql: ${TABLE}.status

  - dimension: status_msg
    type: string
    sql: ${TABLE}.status_msg

  - dimension: user_id
    type: number
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: [id]