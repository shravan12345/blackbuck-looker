- view: base_fssailicense
  sql_table_name: blackbuck_prod.base_fssailicense
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension_group: end
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.end_date

  - dimension: fssai_license_number
    type: string
    sql: ${TABLE}.fssai_license_number

  - dimension_group: start
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.start_date

  - measure: count
    type: count
    drill_fields: [id]

