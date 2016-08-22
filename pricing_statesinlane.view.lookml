- view: pricing_statesinlane
  sql_table_name: blackbuck_prod.pricing_statesinlane
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: from_city_id
    type: number
    sql: ${TABLE}.from_city_id

  - dimension: to_city_id
    type: number
    sql: ${TABLE}.to_city_id

  - measure: count
    type: count
    drill_fields: [id]

