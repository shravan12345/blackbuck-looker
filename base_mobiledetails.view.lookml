- view: base_mobiledetails
  sql_table_name: zinka.base_mobiledetails
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: mobile_make
    type: string
    sql: ${TABLE}.mobile_make

  - dimension: mobile_model
    type: string
    sql: ${TABLE}.mobile_model

  - dimension: mobile_os_type
    type: string
    sql: ${TABLE}.mobile_os_type

  - measure: count
    type: count
    drill_fields: [id]