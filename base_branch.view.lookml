- view: base_branch
  sql_table_name: zinka.base_branch
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: address
    type: string
    sql: ${TABLE}.address

  - dimension: bank_id
    type: number
    sql: ${TABLE}.bank_id

  - dimension: branch
    type: string
    sql: ${TABLE}.branch

  - dimension: city
    type: string
    sql: ${TABLE}.city

  - dimension: contact
    type: string
    sql: ${TABLE}.contact

  - dimension: country
    type: string
    sql: ${TABLE}.country

  - dimension: district
    type: string
    sql: ${TABLE}.district

  - dimension: ifsc
    type: string
    sql: ${TABLE}.ifsc

  - dimension: micr_code
    type: string
    sql: ${TABLE}.micr_code

  - dimension: state
    type: string
    sql: ${TABLE}.state

  - measure: count
    type: count
    drill_fields: [id]