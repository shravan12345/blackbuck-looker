- view: base_truckownerprofile
  sql_table_name: blackbuck_prod.base_truckownerprofile
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: smartphone_given
    type: yesno
    sql: ${TABLE}.smartphone_given

  - dimension: user_id
    type: number
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: [id]

