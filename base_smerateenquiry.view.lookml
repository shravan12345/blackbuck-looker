- view: base_smerateenquiry
  sql_table_name: zinka.base_smerateenquiry
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: adhoc_rate
    type: number
    sql: ${TABLE}.adhoc_rate

  - dimension: aerial_distance
    type: number
    sql: ${TABLE}.aerial_distance

  - dimension: applied_coupon_id
    type: number
    sql: ${TABLE}.applied_coupon_id

  - dimension: body_type
    type: number
    sql: ${TABLE}.body_type

  - dimension: cancel_detail
    type: string
    sql: ${TABLE}.cancel_detail

  - dimension: cancel_reason
    type: number
    sql: ${TABLE}.cancel_reason

  - dimension: commission
    type: number
    sql: ${TABLE}.commission

  - dimension: distance
    type: number
    sql: ${TABLE}.distance

  - dimension_group: end
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.end_date

  - dimension: end_location_id
    type: number
    sql: ${TABLE}.end_location_id

  - dimension: from_city_id
    type: number
    sql: ${TABLE}.from_city_id

  - dimension: no_trucks
    type: number
    sql: ${TABLE}.no_trucks

  - dimension: product_id
    type: number
    sql: ${TABLE}.product_id

  - dimension: product_type_others
    type: string
    sql: ${TABLE}.product_type_others

  - dimension: rate_added_by_id
    type: number
    sql: ${TABLE}.rate_added_by_id

  - dimension_group: rate_expiry
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.rate_expiry_date

  - dimension_group: start
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.start_date

  - dimension: start_location_id
    type: number
    sql: ${TABLE}.start_location_id

  - dimension: state
    type: number
    sql: ${TABLE}.state

  - dimension: suggested_rate_source
    type: number
    sql: ${TABLE}.suggested_rate_source

  - dimension: suggested_rate_source_id
    type: number
    sql: ${TABLE}.suggested_rate_source_id

  - dimension: to_city_id
    type: number
    sql: ${TABLE}.to_city_id

  - dimension: truck_type_id
    type: number
    sql: ${TABLE}.truck_type_id

  - dimension: user_id
    type: number
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: [id]