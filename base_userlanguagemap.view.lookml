- view: base_userlanguagemap
  sql_table_name: blackbuck_prod.base_userlanguagemap
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: language_id
    type: number
    sql: ${TABLE}.language_id

  - dimension: stop_botcall
    type: yesno
    sql: ${TABLE}.stop_botcall

  - dimension: user_id
    type: number
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: [id]

