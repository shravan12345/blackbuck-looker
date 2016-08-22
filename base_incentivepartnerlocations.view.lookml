- view: base_incentivepartnerlocations
  sql_table_name: blackbuck_prod.base_incentivepartnerlocations
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: additional_info
    type: string
    sql: ${TABLE}.additional_info

  - dimension: address
    type: string
    sql: ${TABLE}.address

  - dimension: code
    type: string
    sql: ${TABLE}.code

  - dimension: mobile
    type: string
    sql: ${TABLE}.mobile

  - dimension: partner_id
    type: number
    sql: ${TABLE}.partner_id

  - measure: count
    type: count
    drill_fields: [id]

