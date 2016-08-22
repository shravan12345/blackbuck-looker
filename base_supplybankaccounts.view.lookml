- view: base_supplybankaccounts
  sql_table_name: blackbuck_prod.base_supplybankaccounts
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: beneficiary_acc_num
    type: string
    sql: ${TABLE}.beneficiary_acc_num

  - dimension: beneficiary_ifsc
    type: string
    sql: ${TABLE}.beneficiary_ifsc

  - dimension: beneficiary_name
    type: string
    sql: ${TABLE}.beneficiary_name

  - dimension: source
    type: number
    sql: ${TABLE}.source

  - dimension: source_entity
    type: string
    sql: ${TABLE}.source_entity

  - dimension: state
    type: number
    sql: ${TABLE}.state

  - dimension: supply_partner_id
    type: number
    sql: ${TABLE}.supply_partner_id

  - dimension: updated_by_id
    type: number
    sql: ${TABLE}.updated_by_id

  - measure: count
    type: count
    drill_fields: [id, beneficiary_name]

