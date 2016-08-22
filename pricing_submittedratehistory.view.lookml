- view: pricing_submittedratehistory
  sql_table_name: blackbuck_prod.pricing_submittedratehistory
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: customer
    type: string
    sql: ${TABLE}.customer

  - dimension: from_city
    type: string
    sql: ${TABLE}.from_city

  - dimension: from_city_location_id
    type: number
    sql: ${TABLE}.from_city_location_id

  - dimension: rate
    type: number
    sql: ${TABLE}.rate

  - dimension: rate_type
    type: number
    sql: ${TABLE}.rate_type

  - dimension: rfq_id
    type: number
    sql: ${TABLE}.rfq_id

  - dimension: submitted_by_id
    type: number
    sql: ${TABLE}.submitted_by_id

  - dimension_group: submitted
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.submitted_on

  - dimension: to_city
    type: string
    sql: ${TABLE}.to_city

  - dimension: to_city_location_id
    type: number
    sql: ${TABLE}.to_city_location_id

  - dimension: truck_type_id
    type: number
    sql: ${TABLE}.truck_type_id

  - measure: count
    type: count
    drill_fields: [id]

