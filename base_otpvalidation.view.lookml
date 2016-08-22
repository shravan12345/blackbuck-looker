- view: base_otpvalidation
  sql_table_name: blackbuck_prod.base_otpvalidation
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension_group: dt_added
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_added

  - dimension: encrypted
    type: yesno
    sql: ${TABLE}.encrypted

  - dimension: entity_id
    type: number
    sql: ${TABLE}.entity_id

  - dimension: entity_type
    type: number
    sql: ${TABLE}.entity_type

  - dimension_group: expiry
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.expiry_date

  - dimension: otp
    type: string
    sql: ${TABLE}.otp

  - dimension: validated
    type: yesno
    sql: ${TABLE}.validated

  - dimension_group: validation
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.validation_date

  - measure: count
    type: count
    drill_fields: [id]

