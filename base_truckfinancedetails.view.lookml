- view: base_truckfinancedetails
  sql_table_name: zinka.base_truckfinancedetails
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: bank_name
    type: string
    sql: ${TABLE}.bank_name

  - dimension: branch
    type: string
    sql: ${TABLE}.branch

  - dimension: emi_loan
    type: string
    sql: ${TABLE}.emi_loan

  - dimension: emi_period
    type: string
    sql: ${TABLE}.emi_period

  - dimension: spot_payment
    type: number
    sql: ${TABLE}.spot_payment

  - dimension: time_left
    type: string
    sql: ${TABLE}.time_left

  - dimension: truck_id
    type: number
    sql: ${TABLE}.truck_id

  - measure: count
    type: count
    drill_fields: [id, bank_name]