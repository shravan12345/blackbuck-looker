- view: base_orderinvoicestatus
  sql_table_name: blackbuck_prod.base_orderinvoicestatus
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: added_by_id
    type: number
    sql: ${TABLE}.added_by_id

  - dimension_group: dt_added
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_added

  - dimension_group: dt_updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_updated

  - dimension: last_modified_by_id
    type: number
    sql: ${TABLE}.last_modified_by_id

  - dimension: order_id
    type: number
    sql: ${TABLE}.order_id

  - dimension: status
    type: string
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: [id]

