- view: base_statustransitionreasons
  sql_table_name: blackbuck_prod.base_statustransitionreasons
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: is_active
    type: yesno
    sql: ${TABLE}.is_active

  - dimension: ordering_rank
    type: number
    sql: ${TABLE}.ordering_rank

  - dimension: reason
    type: string
    sql: ${TABLE}.reason

  - dimension: transition_type
    type: number
    sql: ${TABLE}.transition_type

  - measure: count
    type: count
    drill_fields: [id]

