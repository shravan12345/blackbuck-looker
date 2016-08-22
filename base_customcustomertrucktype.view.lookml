- view: base_customcustomertrucktype
  sql_table_name: blackbuck_prod.base_customcustomertrucktype
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: custom_truck_type
    type: string
    sql: ${TABLE}.custom_truck_type

  - dimension: custom_tt_tonnage
    type: number
    sql: ${TABLE}.custom_tt_tonnage

  - dimension: customer_id
    type: number
    sql: ${TABLE}.customer_id

  - dimension: truck_type_id
    type: number
    sql: ${TABLE}.truck_type_id

  - measure: count
    type: count
    drill_fields: [id]

