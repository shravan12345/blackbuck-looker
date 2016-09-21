- view: pricing_laneratefiles
  sql_table_name: zinka.pricing_laneratefiles
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: added_by_id
    type: number
    sql: ${TABLE}.added_by_id

  - dimension_group: added
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.added_time

  - dimension: entry_file
    type: string
    sql: ${TABLE}.entry_file

  - measure: count
    type: count
    drill_fields: [id]