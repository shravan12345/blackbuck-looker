- view: base_reportssubscription_user
  sql_table_name: blackbuck_prod.base_reportssubscription_user
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: reportssubscription_id
    type: number
    sql: ${TABLE}.reportssubscription_id

  - dimension: user_id
    type: number
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: [id]

