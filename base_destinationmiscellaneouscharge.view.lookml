- view: base_destinationmiscellaneouscharge
  sql_table_name: zinka.base_destinationmiscellaneouscharge
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: charge
    type: number
    sql: ${TABLE}.charge

  - dimension: order_finance_details_id
    type: number
    sql: ${TABLE}.order_finance_details_id

  - dimension: type_of_charge
    type: number
    sql: ${TABLE}.type_of_charge

  - measure: count
    type: count
    drill_fields: [id]