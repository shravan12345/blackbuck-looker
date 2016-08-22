- view: base_fuelpartners
  sql_table_name: blackbuck_prod.base_fuelpartners
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: auth_info
    type: string
    sql: ${TABLE}.auth_info

  - dimension: discount
    type: number
    sql: ${TABLE}.discount

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - dimension: state
    type: number
    sql: ${TABLE}.state

  - measure: count
    type: count
    drill_fields: [id, name]

