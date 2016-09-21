- view: base_geolocation
  sql_table_name: zinka.base_geolocation
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: accuracy
    type: number
    sql: ${TABLE}.accuracy

  - dimension: city
    type: string
    sql: ${TABLE}.city

  - dimension: city_code
    type: string
    sql: ${TABLE}.city_code

  - dimension: country_code
    type: string
    sql: ${TABLE}.country_code

  - dimension: district
    type: string
    sql: ${TABLE}.district

  - dimension: district_code
    type: string
    sql: ${TABLE}.district_code

  - dimension: latitude
    type: number
    sql: ${TABLE}.latitude

  - dimension: longitude
    type: number
    sql: ${TABLE}.longitude

  - dimension: place
    type: string
    sql: ${TABLE}.place

  - dimension: postal_code
    type: string
    sql: ${TABLE}.postal_code

  - dimension: state
    type: string
    sql: ${TABLE}.state

  - dimension: state_code
    type: string
    sql: ${TABLE}.state_code

  - measure: count
    type: count
    drill_fields: [id]