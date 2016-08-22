- view: base_orderdocumentstatus
  sql_table_name: blackbuck_prod.base_orderdocumentstatus
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

  - dimension: status
    type: number
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: [id]

