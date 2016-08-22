- view: base_language_states
  sql_table_name: blackbuck_prod.base_language_states
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: language_id
    type: number
    sql: ${TABLE}.language_id

  - dimension: state_id
    type: number
    sql: ${TABLE}.state_id

  - measure: count
    type: count
    drill_fields: [id]

