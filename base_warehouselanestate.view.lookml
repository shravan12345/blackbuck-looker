- view: base_warehouselanestate
  sql_table_name: blackbuck_prod.base_warehouselanestate
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: state_id
    type: number
    sql: ${TABLE}.state_id

  - dimension: warehouselane_id
    type: number
    sql: ${TABLE}.warehouselane_id

  - measure: count
    type: count
    drill_fields: [id]

