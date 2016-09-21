- view: auth_user_groups
  sql_table_name: zinka.auth_user_groups
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: group_id
    type: number
    sql: ${TABLE}.group_id

  - dimension: user_id
    type: number
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: [id]