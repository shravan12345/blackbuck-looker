- view: base_truckmanager
  sql_table_name: zinka.base_truckmanager
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: owner_id
    type: number
    sql: ${TABLE}.owner_id

  - dimension: truck_id
    type: number
    sql: ${TABLE}.truck_id

  - measure: count
    type: count
    drill_fields: [id]