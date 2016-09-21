- view: base_role
  sql_table_name: zinka.base_role
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: functions
    type: string
    sql: ${TABLE}.functions

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - dimension: orders_access
    type: number
    sql: ${TABLE}.orders_access

  - dimension: profitability_access
    type: number
    sql: ${TABLE}.profitability_access

  - measure: count
    type: count
    drill_fields: [id, name]