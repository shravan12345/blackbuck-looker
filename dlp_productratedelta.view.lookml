- view: dlp_productratedelta
  sql_table_name: blackbuck_prod.dlp_productratedelta
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: comments
    type: string
    sql: ${TABLE}.comments

  - dimension: from_warehouse_id
    type: number
    sql: ${TABLE}.from_warehouse_id

  - dimension: is_active
    type: yesno
    sql: ${TABLE}.is_active

  - dimension: product_id
    type: number
    sql: ${TABLE}.product_id

  - dimension: rate_delta
    type: number
    sql: ${TABLE}.rate_delta

  - dimension: to_warehouse_id
    type: number
    sql: ${TABLE}.to_warehouse_id

  - dimension: truck_type_id
    type: number
    sql: ${TABLE}.truck_type_id

  - dimension: updated_by_id
    type: number
    sql: ${TABLE}.updated_by_id

  - measure: count
    type: count
    drill_fields: [id]

