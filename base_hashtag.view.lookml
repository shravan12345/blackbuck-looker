- view: base_hashtag
  sql_table_name: blackbuck_prod.base_hashtag
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: added_by_id
    type: number
    sql: ${TABLE}.added_by_id

  - dimension: frequency
    type: number
    sql: ${TABLE}.frequency

  - dimension: tag_name
    type: string
    sql: ${TABLE}.tag_name

  - measure: count
    type: count
    drill_fields: [id, tag_name]

