- view: auth_permission
  sql_table_name: blackbuck_prod.auth_permission
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: codename
    type: string
    sql: ${TABLE}.codename

  - dimension: content_type_id
    type: number
    sql: ${TABLE}.content_type_id

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - measure: count
    type: count
    drill_fields: [id, name, codename]

