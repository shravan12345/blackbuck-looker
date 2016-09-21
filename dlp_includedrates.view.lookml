- view: dlp_includedrates
  sql_table_name: zinka.dlp_includedrates
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: comments
    type: string
    sql: ${TABLE}.comments

  - dimension: is_active
    type: yesno
    sql: ${TABLE}.is_active

  - dimension: loading_rate
    type: number
    sql: ${TABLE}.loading_rate

  - dimension: product_id
    type: number
    sql: ${TABLE}.product_id

  - dimension: truck_type_id
    type: number
    sql: ${TABLE}.truck_type_id

  - dimension: unloading_rate
    type: number
    sql: ${TABLE}.unloading_rate

  - dimension: updated_by_id
    type: number
    sql: ${TABLE}.updated_by_id

  - dimension: warehouse_id
    type: number
    sql: ${TABLE}.warehouse_id

  - measure: count
    type: count
    drill_fields: [id]