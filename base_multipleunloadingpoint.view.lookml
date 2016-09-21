- view: base_multipleunloadingpoint
  sql_table_name: zinka.base_multipleunloadingpoint
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: last_modified_by_id
    type: number
    sql: ${TABLE}.last_modified_by_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified_date

  - dimension: order_id
    type: number
    sql: ${TABLE}.order_id

  - dimension: unloading_point_warehouse_id
    type: number
    sql: ${TABLE}.unloading_point_warehouse_id

  - measure: count
    type: count
    drill_fields: [id]