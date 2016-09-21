- view: base_bonusscheme
  sql_table_name: zinka.base_bonusscheme
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: bonus_amount
    type: string
    sql: ${TABLE}.bonus_amount

  - dimension: condition
    type: string
    sql: ${TABLE}.`condition`

  - dimension_group: end
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.end_time

  - dimension: scheme_image
    type: string
    sql: ${TABLE}.scheme_image

  - dimension: scheme_text
    type: string
    sql: ${TABLE}.scheme_text

  - dimension_group: start
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.start_time

  - measure: count
    type: count
    drill_fields: [id]