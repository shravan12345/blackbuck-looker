- view: base_customerspecificops_ops_users
  sql_table_name: zinka.base_customerspecificops_ops_users
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: customerspecificops_id
    type: number
    sql: ${TABLE}.customerspecificops_id

  - dimension: user_id
    type: number
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: [id]