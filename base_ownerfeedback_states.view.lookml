- view: base_ownerfeedback_states
  sql_table_name: zinka.base_ownerfeedback_states
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: ownerfeedback_id
    type: number
    sql: ${TABLE}.ownerfeedback_id

  - dimension: state_id
    type: number
    sql: ${TABLE}.state_id

  - measure: count
    type: count
    drill_fields: [id]