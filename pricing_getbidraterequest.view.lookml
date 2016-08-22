- view: pricing_getbidraterequest
  sql_table_name: blackbuck_prod.pricing_getbidraterequest
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: input_file
    type: string
    sql: ${TABLE}.input_file

  - dimension_group: request
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.request_time

  - dimension: requested_by_id
    type: number
    sql: ${TABLE}.requested_by_id

  - dimension: response_file
    type: string
    sql: ${TABLE}.response_file

  - measure: count
    type: count
    drill_fields: [id]

