- view: base_orderdynamicprice
  sql_table_name: blackbuck_prod.base_orderdynamicprice
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: auto_inteval_set
    type: yesno
    sql: ${TABLE}.auto_inteval_set

  - dimension: cft_price
    type: number
    sql: ${TABLE}.cft_price

  - dimension: is_active
    type: yesno
    sql: ${TABLE}.is_active

  - dimension_group: last_notified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_notified_time

  - dimension: loading_charges
    type: number
    sql: ${TABLE}.loading_charges

  - dimension: maximum_price
    type: number
    sql: ${TABLE}.maximum_price

  - dimension: minimum_price
    type: number
    sql: ${TABLE}.minimum_price

  - dimension: order_id
    type: number
    sql: ${TABLE}.order_id

  - dimension: price
    type: number
    sql: ${TABLE}.price

  - dimension: price_delta
    type: number
    sql: ${TABLE}.price_delta

  - dimension: price_interval
    type: number
    sql: ${TABLE}.price_interval

  - dimension_group: price
    type: time
    timeframes: [time, date, week, month,hour_of_day,hour]
    sql: ${TABLE}.price_time

  - dimension_group: start
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.start_time

  - dimension: surge_by_id
    type: number
    sql: ${TABLE}.surge_by_id

  - dimension: surge_charge
    type: number
    sql: ${TABLE}.surge_charge

  - dimension: surge_enabled
    type: yesno
    sql: ${TABLE}.surge_enabled

  - dimension: surge_started_price
    type: number
    sql: ${TABLE}.surge_started_price

  - dimension_group: surge_started
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.surge_started_time

  - dimension: unloading_charges
    type: number
    sql: ${TABLE}.unloading_charges

  - dimension: updated_by_id
    type: number
    sql: ${TABLE}.updated_by_id

  - measure: count
    type: count
    drill_fields: [id,base_order.id]

  - measure: R1
    type: number
    sql: ${minimum_price}
    
  - measure: R2
    type: number
    sql: ${maximum_price}
    
  - measure: Placed_under_R2
    type: count_distinct
    sql: CASE WHEN ${base_order.order_value} <= ${maximum_price} THEN ${order_id}
         ELSE 0 END
         
  - measure: Target_Rates
    type: avg
    sql: ${cft_price}
    value_format_name: decimal_2
    filters:
        base_order.end_date : 1 day ago
    drill_fields: [order_id,cft_price]
    
  
    
 
    
    