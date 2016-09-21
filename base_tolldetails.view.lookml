- view: base_tolldetails
  sql_table_name: zinka.base_tolldetails
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: address
    type: string
    sql: ${TABLE}.address

  - dimension: fast_tag_enabled
    type: yesno
    sql: ${TABLE}.fast_tag_enabled

  - dimension: latitude
    type: number
    sql: ${TABLE}.latitude

  - dimension: longitude
    type: number
    sql: ${TABLE}.longitude

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - dimension: stretch
    type: string
    sql: ${TABLE}.stretch

  - dimension: tollable_length
    type: number
    sql: ${TABLE}.Tollable_length

  - measure: count
    type: count
    drill_fields: [id, name]