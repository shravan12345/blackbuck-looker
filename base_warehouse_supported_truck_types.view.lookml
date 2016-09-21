- view: base_warehouse_supported_truck_types
  sql_table_name: zinka.base_warehouse_supported_truck_types
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: trucktype_id
    type: number
    sql: ${TABLE}.trucktype_id

  - dimension: warehouse_id
    type: number
    sql: ${TABLE}.warehouse_id

  - measure: count
    type: count
    drill_fields: [id]