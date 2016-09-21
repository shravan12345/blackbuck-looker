- view: dlp_laneratetargetsstatus
  sql_table_name: zinka.dlp_laneratetargetsstatus
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: added_by_id
    type: number
    sql: ${TABLE}.added_by_id

  - dimension: cft_target_rate
    type: number
    sql: ${TABLE}.cft_target_rate

  - dimension: comments
    type: string
    sql: ${TABLE}.comments

  - dimension_group: end
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.end_time

  - dimension: lane_rate_target_id
    type: number
    sql: ${TABLE}.lane_rate_target_id

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

  - dimension_group: start
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.start_time

  - measure: count
    type: count
    drill_fields: [id]