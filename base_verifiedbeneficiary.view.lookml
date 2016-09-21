- view: base_verifiedbeneficiary
  sql_table_name: zinka.base_verifiedbeneficiary
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

  - dimension: returned_beneficiary_name
    type: string
    sql: ${TABLE}.returned_beneficiary_name

  - measure: count
    type: count
    drill_fields: [id, beneficiary_name, returned_beneficiary_name]