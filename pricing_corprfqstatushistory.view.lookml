- view: pricing_corprfqstatushistory
  sql_table_name: blackbuck_prod.pricing_corprfqstatushistory
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: enquiry_id
    type: number
    sql: ${TABLE}.enquiry_id

  - dimension: status
    type: number
    sql: ${TABLE}.status

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - dimension: updated_by_id
    type: number
    sql: ${TABLE}.updated_by_id

  - measure: count
    type: count
    drill_fields: [id]

