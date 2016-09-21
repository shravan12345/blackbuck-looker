- view: base_ordertracking
  sql_table_name: zinka.base_ordertracking
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: order_id
    type: number
    sql: ${TABLE}.order_id

  - dimension: tracking_device_id
    type: number
    sql: ${TABLE}.tracking_device_id

  - measure: count
    type: count
    drill_fields: [id]