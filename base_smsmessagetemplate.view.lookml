- view: base_smsmessagetemplate
  sql_table_name: zinka.base_smsmessagetemplate
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: language
    type: number
    sql: ${TABLE}.language

  - dimension: message
    type: string
    sql: ${TABLE}.message

  - dimension: reason
    type: number
    sql: ${TABLE}.reason

  - measure: count
    type: count
    drill_fields: [id]