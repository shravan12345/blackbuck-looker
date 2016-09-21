- view: base_relationmanager
  sql_table_name: zinka.base_relationmanager
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: customer_id
    type: number
    sql: ${TABLE}.customer_id

  - dimension: manager_id
    type: number
    sql: ${TABLE}.manager_id

  - measure: count
    type: count
    drill_fields: [id]