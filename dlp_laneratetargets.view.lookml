- view: dlp_laneratetargets
  sql_table_name: zinka.dlp_laneratetargets
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: cft_target_rate
    type: number
    sql: ${TABLE}.cft_target_rate

  - dimension: comments
    type: string
    sql: ${TABLE}.comments

  - dimension: from_city_id
    type: number
    sql: ${TABLE}.from_city_id

  - dimension: from_sublocation_id
    type: number
    sql: ${TABLE}.from_sublocation_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified_time

  - dimension: market_target_rate
    type: number
    sql: ${TABLE}.market_target_rate

  - dimension: max_app_rate
    type: number
    sql: ${TABLE}.max_app_rate

  - dimension: min_app_rate
    type: number
    sql: ${TABLE}.min_app_rate

  - dimension: rate_per_ton
    type: number
    sql: ${TABLE}.rate_per_ton

  - dimension: to_city_id
    type: number
    sql: ${TABLE}.to_city_id

  - dimension: to_sublocation_id
    type: number
    sql: ${TABLE}.to_sublocation_id

  - dimension: truck_type_id
    type: number
    sql: ${TABLE}.truck_type_id

  - dimension: updated_by_id
    type: number
    sql: ${TABLE}.updated_by_id

  - measure: count
    type: count
    drill_fields: [id]
    
  - measure: Target_Rate
    type: average 
    sql: ${cft_target_rate}
    drill_fields: [from_city_id,to_city_id,from_sublocation_id,to_sublocation_id,truck_type_id,cft_target_rate]