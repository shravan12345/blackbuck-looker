- view: base_zone_states
  sql_table_name: blackbuck_prod.base_zone_states
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: state_id
    type: number
    sql: ${TABLE}.state_id

  - dimension: zone_id
    type: number
    sql: ${TABLE}.zone_id

  - measure: count
    type: count
    drill_fields: [id]

