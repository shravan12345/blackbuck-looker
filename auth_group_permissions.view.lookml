- view: auth_group_permissions
  sql_table_name: blackbuck_prod.auth_group_permissions
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: group_id
    type: number
    sql: ${TABLE}.group_id

  - dimension: permission_id
    type: number
    sql: ${TABLE}.permission_id

  - measure: count
    type: count
    drill_fields: [id]

