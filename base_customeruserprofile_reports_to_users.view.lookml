- view: base_customeruserprofile_reports_to_users
  sql_table_name: blackbuck_prod.base_customeruserprofile_reports_to_users
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: customeruserprofile_id
    type: number
    sql: ${TABLE}.customeruserprofile_id

  - dimension: user_id
    type: number
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: [id]

