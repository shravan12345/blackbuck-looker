- view: base_customermasterfrieghtrates
  sql_table_name: zinka.base_customermasterfrieghtrates
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id
    hidden: true

  - dimension: contract_diesel_rate
    type: number
    sql: ${TABLE}.contract_diesel_rate
    hidden: true

  - dimension_group: contract_diesel_rate
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.contract_diesel_rate_date
    hidden: true

  - dimension: customer_id
    type: number
    sql: ${TABLE}.customer_id

  - dimension_group: end
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.end_time

  - dimension: from_city_id
    type: number
    sql: ${TABLE}.from_city_id
    hidden: true

  - dimension: from_warehouse_id
    type: number
    sql: ${TABLE}.from_warehouse_id
    hidden: true

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
    hidden: true

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
    hidden: true

  - dimension: to_warehouse_id
    type: number
    sql: ${TABLE}.to_warehouse_id
    hidden: true

  - dimension: truck_type_id
    type: number
    sql: ${TABLE}.truck_type_id

  - measure: count
    type: count
    drill_fields: [id]
    
  - measure: Present_Date_Rate
    type: date
    sql: MAX(${start_time})
    convert_tz: false 
    
  - measure: Rate
    type: number
    sql: ${rate}
  
  
  
    
    
    