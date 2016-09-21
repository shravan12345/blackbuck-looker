- view: base_leadsgroup
  sql_table_name: zinka.base_leadsgroup
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: index
    type: number
    sql: ${TABLE}.`index`

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - measure: count
    type: count
    drill_fields: [id, name]