- view: base_messagesinfo
  sql_table_name: zinka.base_messagesinfo
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: ignore
    type: yesno
    sql: ${TABLE}.`ignore`

  - dimension: message_id
    type: number
    sql: ${TABLE}.message_id

  - measure: count
    type: count
    drill_fields: [id]