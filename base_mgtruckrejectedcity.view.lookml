- view: base_mgtruckrejectedcity
  sql_table_name: blackbuck_prod.base_mgtruckrejectedcity
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

  - dimension: location_id
    type: number
    sql: ${TABLE}.location_id

  - dimension: truck_id
    type: number
    sql: ${TABLE}.truck_id

  - measure: count
    type: count
    drill_fields: [id]

