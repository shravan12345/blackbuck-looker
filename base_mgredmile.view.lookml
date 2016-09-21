- view: base_mgredmile
  sql_table_name: zinka.base_mgredmile
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: amount
    type: number
    sql: ${TABLE}.amount

  - dimension: created_by_id
    type: number
    sql: ${TABLE}.created_by_id

  - dimension: dest_latitude
    type: number
    sql: ${TABLE}.dest_latitude

  - dimension: dest_location
    type: string
    sql: ${TABLE}.dest_location

  - dimension: dest_longitude
    type: number
    sql: ${TABLE}.dest_longitude

  - dimension: distance
    type: number
    sql: ${TABLE}.distance

  - dimension_group: dt_added
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_added

  - dimension_group: dt_updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_updated

  - dimension_group: end
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.end_date

  - dimension: source_latitude
    type: number
    sql: ${TABLE}.source_latitude

  - dimension: source_location
    type: string
    sql: ${TABLE}.source_location

  - dimension: source_longitude
    type: number
    sql: ${TABLE}.source_longitude

  - dimension_group: start
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.start_date

  - dimension: status
    type: string
    sql: ${TABLE}.status

  - dimension: supply_bank_id
    type: number
    sql: ${TABLE}.supply_bank_id

  - dimension: truck_id
    type: number
    sql: ${TABLE}.truck_id

  - dimension: updated_by_id
    type: number
    sql: ${TABLE}.updated_by_id

  - measure: count
    type: count
    drill_fields: [id]