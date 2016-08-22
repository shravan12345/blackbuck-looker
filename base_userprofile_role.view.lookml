- view: base_userprofile_role
  sql_table_name: blackbuck_prod.base_userprofile_role
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: role_id
    type: number
    sql: ${TABLE}.role_id

  - dimension: userprofile_id
    type: number
    sql: ${TABLE}.userprofile_id

  - measure: count
    type: count
    drill_fields: [id]

