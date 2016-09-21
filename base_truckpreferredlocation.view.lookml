- view: base_truckpreferredlocation
  sql_table_name: zinka.base_truckpreferredlocation
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: created_by_id
    type: number
    sql: ${TABLE}.created_by_id

  - dimension_group: dt_added
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_added

  - dimension_group: dt_updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_updated

  - dimension: from_city_id
    type: number
    sql: ${TABLE}.from_city_id

  - dimension: priority
    type: number
    sql: ${TABLE}.priority

  - dimension: to_city_id
    type: number
    sql: ${TABLE}.to_city_id

  - dimension: truck_id
    type: number
    sql: ${TABLE}.truck_id

  - measure: count
    type: count
    drill_fields: [id]