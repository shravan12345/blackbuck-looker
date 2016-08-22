- view: base_gcmkey
  sql_table_name: blackbuck_prod.base_gcmkey
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: active
    type: yesno
    sql: ${TABLE}.active

  - dimension_group: dt_added
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_added

  - dimension: gcm_key
    type: string
    sql: ${TABLE}.gcm_key

  - measure: count
    type: count
    drill_fields: [id]

