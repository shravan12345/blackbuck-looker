- view: base_podspercourier
  sql_table_name: zinka.base_podspercourier
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

  - dimension: last_modified_by_id
    type: number
    sql: ${TABLE}.last_modified_by_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified_date

  - dimension: latitude
    type: number
    sql: ${TABLE}.latitude

  - dimension: location_name
    type: string
    sql: ${TABLE}.location_name

  - dimension: longitude
    type: number
    sql: ${TABLE}.longitude

  - dimension: no_of_pods
    type: number
    sql: ${TABLE}.no_of_pods
    drill_fields: [base_orderdocument.order_id,base_order.last_modified_date]

  - measure: count
    type: count
    drill_fields: [id, location_name]