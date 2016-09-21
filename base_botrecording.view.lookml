- view: base_botrecording
  sql_table_name: zinka.base_botrecording
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: language
    type: string
    sql: ${TABLE}.language

  - dimension: language_url
    type: string
    sql: ${TABLE}.language_url

  - measure: count
    type: count
    drill_fields: [id]