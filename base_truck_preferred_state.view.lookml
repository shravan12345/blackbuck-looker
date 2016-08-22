- view: base_truck_preferred_state
  sql_table_name: blackbuck_prod.base_truck_preferred_state
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: state_id
    type: number
    sql: ${TABLE}.state_id

  - dimension: truck_id
    type: number
    sql: ${TABLE}.truck_id

  - measure: count
    type: count
    drill_fields: [id]

