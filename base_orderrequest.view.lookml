- view: base_orderrequest
  sql_table_name: zinka.base_orderrequest
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: converted_orders
    type: string
    sql: ${TABLE}.converted_orders

  - dimension: customer_id
    type: number
    sql: ${TABLE}.customer_id

  - dimension: end_location
    type: string
    sql: ${TABLE}.end_location

  - dimension: num_trucks
    type: number
    sql: ${TABLE}.num_trucks

  - dimension: order_request_status
    type: number
    sql: ${TABLE}.order_request_status

  - dimension_group: order_requested
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.order_requested_date

  - dimension: product_id
    type: number
    sql: ${TABLE}.product_id

  - dimension: requested_by_id
    type: number
    sql: ${TABLE}.requested_by_id

  - dimension_group: shipment
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.shipment_date

  - dimension: start_location
    type: string
    sql: ${TABLE}.start_location

  - dimension: status_modified_by_id
    type: number
    sql: ${TABLE}.status_modified_by_id

  - dimension_group: status_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.status_modified_date

  - dimension: truck_type_id
    type: number
    sql: ${TABLE}.truck_type_id

  - measure: count
    type: count
    drill_fields: [id]