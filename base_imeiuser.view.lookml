- view: base_imeiuser
  sql_table_name: blackbuck_prod.base_imeiuser
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: imei_id
    type: number
    sql: ${TABLE}.imei_id

  - dimension_group: time_stamp
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.time_stamp

  - dimension: user_id
    type: number
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: [id]

