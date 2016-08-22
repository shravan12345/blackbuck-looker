- view: base_botcallsorderstotrack
  sql_table_name: blackbuck_prod.base_botcallsorderstotrack
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: assigned_driver_id
    type: number
    sql: ${TABLE}.assigned_driver_id

  - dimension_group: dt_added
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_added

  - dimension: order_id
    type: number
    sql: ${TABLE}.order_id

  - dimension: phone_number
    type: string
    sql: ${TABLE}.phone_number

  - dimension: registration_number
    type: string
    sql: ${TABLE}.registration_number

  - measure: count
    type: count
    drill_fields: [id]

