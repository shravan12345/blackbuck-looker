- view: base_fuelcards
  sql_table_name: zinka.base_fuelcards
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: added_by_id
    type: number
    sql: ${TABLE}.added_by_id

  - dimension_group: added
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.added_date

  - dimension: card_number
    type: string
    sql: ${TABLE}.card_number

  - dimension: fuel_partner_id
    type: number
    sql: ${TABLE}.fuel_partner_id

  - dimension: image_url
    type: string
    sql: ${TABLE}.image_url

  - dimension: truck_id
    type: number
    sql: ${TABLE}.truck_id

  - measure: count
    type: count
    drill_fields: [id]