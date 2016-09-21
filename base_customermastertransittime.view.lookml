- view: base_customermastertransittime
  sql_table_name: zinka.base_customermastertransittime
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: customer_id
    type: number
    sql: ${TABLE}.customer_id

  - dimension: from_city_id
    type: number
    sql: ${TABLE}.from_city_id

  - dimension_group: last_updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated_at

  - dimension: last_updated_by_id
    type: number
    sql: ${TABLE}.last_updated_by_id

  - dimension: to_city_id
    type: number
    sql: ${TABLE}.to_city_id

  - dimension: transit_time
    type: number
    sql: ${TABLE}.transit_time

  - measure: count
    type: count
    drill_fields: [id]