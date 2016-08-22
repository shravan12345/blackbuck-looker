- view: base_transitiongcm
  sql_table_name: blackbuck_prod.base_transitiongcm
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: msg_template
    type: string
    sql: ${TABLE}.msg_template

  - dimension: priority
    type: number
    sql: ${TABLE}.priority

  - dimension: role_id
    type: number
    sql: ${TABLE}.role_id

  - dimension: transition
    type: string
    sql: ${TABLE}.transition

  - measure: count
    type: count
    drill_fields: [id]

