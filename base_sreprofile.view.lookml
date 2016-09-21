- view: base_sreprofile
  sql_table_name: zinka.base_sreprofile
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: leads_capacity
    type: number
    sql: ${TABLE}.leads_capacity

  - dimension: user_id
    type: number
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: [id]