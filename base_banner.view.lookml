- view: base_banner
  sql_table_name: zinka.base_banner
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: banner_html
    type: string
    sql: ${TABLE}.banner_html

  - dimension: banner_image_url
    type: string
    sql: ${TABLE}.banner_image_url

  - dimension: banner_type
    type: number
    sql: ${TABLE}.banner_type

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_time

  - measure: count
    type: count
    drill_fields: [id]