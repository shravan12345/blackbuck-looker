- view: bbauth_uservalidation
  sql_table_name: blackbuck_prod.bbauth_uservalidation
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: client_type
    type: number
    sql: ${TABLE}.client_type

  - dimension: status
    type: number
    sql: ${TABLE}.status

  - dimension: updated_by_id
    type: number
    sql: ${TABLE}.updated_by_id

  - dimension: user_id
    type: number
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: [id]

