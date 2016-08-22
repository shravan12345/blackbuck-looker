- view: base_truckclassification
  sql_table_name: blackbuck_prod.base_truckclassification
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: truck_type_id
    type: number
    sql: ${TABLE}.truck_type_id

  - measure: count
    type: count
    drill_fields: [id]

