- view: pricing_corprfqfileshistory
  sql_table_name: blackbuck_prod.pricing_corprfqfileshistory
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: enquiry_id
    type: number
    sql: ${TABLE}.enquiry_id

  - dimension: file_type
    type: number
    sql: ${TABLE}.file_type

  - dimension: file_url
    type: string
    sql: ${TABLE}.file_url

  - dimension_group: uploaded
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.uploaded_at

  - dimension: uploaded_by_id
    type: number
    sql: ${TABLE}.uploaded_by_id

  - measure: count
    type: count
    drill_fields: [id]

