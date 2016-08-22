- view: base_cashcard
  sql_table_name: blackbuck_prod.base_cashcard
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: beneficiary_name
    type: string
    sql: ${TABLE}.beneficiary_name

  - dimension: card_number
    type: string
    sql: ${TABLE}.card_number

  - dimension: card_user_name
    type: string
    sql: ${TABLE}.card_user_name

  - dimension: home_location_id
    type: number
    sql: ${TABLE}.home_location_id

  - measure: count
    type: count
    drill_fields: [id, card_user_name, beneficiary_name]

