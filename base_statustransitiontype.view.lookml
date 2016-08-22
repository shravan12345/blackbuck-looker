- view: base_statustransitiontype
  sql_table_name: blackbuck_prod.base_statustransitiontype
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: display_name
    type: string
    sql: ${TABLE}.display_name

  - dimension: is_active
    type: yesno
    sql: ${TABLE}.is_active

  - dimension: role_id
    type: number
    sql: ${TABLE}.role_id

  - dimension: transition_type
    type: number
    sql: ${TABLE}.transition_type

  - measure: count
    type: count
    drill_fields: [id, display_name]

