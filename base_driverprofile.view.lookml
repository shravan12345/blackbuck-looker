- view: base_driverprofile
  sql_table_name: blackbuck_prod.base_driverprofile
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: dl_image
    type: string
    sql: ${TABLE}.dl_image

  - dimension: dl_number
    type: string
    sql: ${TABLE}.dl_number

  - dimension: language_id
    type: number
    sql: ${TABLE}.language_id

  - dimension: user_id
    type: number
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: [id]

