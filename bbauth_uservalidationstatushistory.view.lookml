- view: bbauth_uservalidationstatushistory
  sql_table_name: zinka.bbauth_uservalidationstatushistory
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension_group: dt_added
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_added

  - dimension_group: dt_updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_updated

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