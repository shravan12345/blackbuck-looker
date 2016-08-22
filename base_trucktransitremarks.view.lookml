- view: base_trucktransitremarks
  sql_table_name: blackbuck_prod.base_trucktransitremarks
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: comment
    type: string
    sql: ${TABLE}.comment

  - dimension: created_by_id
    type: number
    sql: ${TABLE}.created_by_id

  - dimension_group: dt_added
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_added

  - dimension: truck_id
    type: number
    sql: ${TABLE}.truck_id

  - measure: count
    type: count
    drill_fields: [id]

