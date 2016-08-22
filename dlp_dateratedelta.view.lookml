- view: dlp_dateratedelta
  sql_table_name: blackbuck_prod.dlp_dateratedelta
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: comments
    type: string
    sql: ${TABLE}.comments

  - dimension_group: end
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.end_date

  - dimension: from_city_id
    type: number
    sql: ${TABLE}.from_city_id

  - dimension: from_sublocation_id
    type: number
    sql: ${TABLE}.from_sublocation_id

  - dimension: from_warehouse_id
    type: number
    sql: ${TABLE}.from_warehouse_id

  - dimension: is_active
    type: yesno
    sql: ${TABLE}.is_active

  - dimension: product_id
    type: number
    sql: ${TABLE}.product_id

  - dimension: rate_delta
    type: number
    sql: ${TABLE}.rate_delta

  - dimension_group: start
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.start_date

  - dimension: to_city_id
    type: number
    sql: ${TABLE}.to_city_id

  - dimension: to_sublocation_id
    type: number
    sql: ${TABLE}.to_sublocation_id

  - dimension: to_warehouse_id
    type: number
    sql: ${TABLE}.to_warehouse_id

  - dimension: truck_type_id
    type: number
    sql: ${TABLE}.truck_type_id

  - dimension: updated_by_id
    type: number
    sql: ${TABLE}.updated_by_id

  - measure: count
    type: count
    drill_fields: [id]

