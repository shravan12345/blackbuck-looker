- view: base_deletedcustomermasterfreightrates
  sql_table_name: zinka.base_deletedcustomermasterfreightrates
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: contract_diesel_rate
    type: number
    sql: ${TABLE}.contract_diesel_rate

  - dimension_group: contract_diesel_rate
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.contract_diesel_rate_date

  - dimension: customer_id
    type: number
    sql: ${TABLE}.customer_id

  - dimension_group: deleted
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.deleted_at

  - dimension: deleted_by_id
    type: number
    sql: ${TABLE}.deleted_by_id

  - dimension_group: end
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.end_time

  - dimension: from_city_id
    type: number
    sql: ${TABLE}.from_city_id

  - dimension: from_warehouse_id
    type: number
    sql: ${TABLE}.from_warehouse_id

  - dimension_group: last_updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated_at

  - dimension: last_updated_by_id
    type: number
    sql: ${TABLE}.last_updated_by_id

  - dimension: product_type_id
    type: number
    sql: ${TABLE}.product_type_id

  - dimension: rate
    type: number
    sql: ${TABLE}.rate

  - dimension: rate_type
    type: number
    sql: ${TABLE}.rate_type

  - dimension_group: start
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.start_time

  - dimension: to_city_id
    type: number
    sql: ${TABLE}.to_city_id

  - dimension: to_warehouse_id
    type: number
    sql: ${TABLE}.to_warehouse_id

  - dimension: truck_type_id
    type: number
    sql: ${TABLE}.truck_type_id

  - measure: count
    type: count
    drill_fields: [id]