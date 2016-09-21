- view: base_financeuserprofile
  sql_table_name: zinka.base_financeuserprofile
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: imps_limit
    type: number
    sql: ${TABLE}.imps_limit

  - dimension: is_blocked
    type: yesno
    sql: ${TABLE}.is_blocked

  - dimension: user_id
    type: number
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: [id]