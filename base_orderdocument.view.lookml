- view: base_orderdocument
  sql_table_name: zinka.base_orderdocument
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: courier_number
    type: string
    sql: ${TABLE}.courier_number

  - dimension: courier_service_id
    type: number
    sql: ${TABLE}.courier_service_id

  - dimension_group: doc_img_capture
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.doc_img_capture_time

  - dimension: document_status
    type: number
    sql: ${TABLE}.document_status

  - dimension: document_type
    type: number
    sql: ${TABLE}.document_type

  - dimension: document_url
    type: string
    sql: ${TABLE}.document_url

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

  - measure: count
    type: count
    drill_fields: [id]
    
  - measure: count_pod
    type: sum
    sql: CASE WHEN ${document_status} = 2 THEN 1 ELSE 0 END
    drill_fields: [order_id,last_modified_date]