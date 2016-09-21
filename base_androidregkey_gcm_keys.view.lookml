- view: base_androidregkey_gcm_keys
  sql_table_name: zinka.base_androidregkey_gcm_keys
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: androidregkey_id
    type: number
    sql: ${TABLE}.androidregkey_id

  - dimension: gcmkey_id
    type: number
    sql: ${TABLE}.gcmkey_id

  - measure: count
    type: count
    drill_fields: [id]