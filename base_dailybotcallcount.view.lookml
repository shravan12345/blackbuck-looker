- view: base_dailybotcallcount
  sql_table_name: blackbuck_prod.base_dailybotcallcount
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: count
    type: number
    sql: ${TABLE}.count

  - dimension_group: dt_added
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_added



