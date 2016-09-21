- view: base_paymentmethod
  sql_table_name: zinka.base_paymentmethod
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

  - dimension: cash_beneficiary_type
    type: number
    sql: ${TABLE}.cash_beneficiary_type

  - dimension: cash_beneficiary_user_id
    type: number
    sql: ${TABLE}.cash_beneficiary_user_id

  - dimension: cash_card_id
    type: number
    sql: ${TABLE}.cash_card_id

  - dimension: etransfer_beneficiary_type
    type: number
    sql: ${TABLE}.etransfer_beneficiary_type

  - dimension: etransfer_beneficiary_user_id
    type: number
    sql: ${TABLE}.etransfer_beneficiary_user_id

  - dimension: fuel_card_id
    type: number
    sql: ${TABLE}.fuel_card_id

  - dimension: payment_channel
    type: number
    sql: ${TABLE}.payment_channel

  - dimension: supply_partner_account_id
    type: number
    sql: ${TABLE}.supply_partner_account_id

  - measure: count
    type: count
    drill_fields: [id, beneficiary_name]