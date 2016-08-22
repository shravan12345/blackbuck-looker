- view: base_truck_preferred_location
  sql_table_name: blackbuck_prod.base_truck_preferred_location
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: location_id
    type: number
    sql: ${TABLE}.location_id

  - dimension: truck_id
    type: number
    sql: ${TABLE}.truck_id

  - measure: count
    type: count
    drill_fields: [id]

