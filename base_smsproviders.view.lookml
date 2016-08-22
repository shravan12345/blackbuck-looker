- view: base_smsproviders
  sql_table_name: blackbuck_prod.base_smsproviders
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: express
    type: yesno
    sql: ${TABLE}.express

  - dimension: is_active
    type: yesno
    sql: ${TABLE}.is_active

  - dimension: priority
    type: number
    sql: ${TABLE}.priority

  - dimension: provider_name
    type: string
    sql: ${TABLE}.provider_name

  - dimension: url
    type: string
    sql: ${TABLE}.url

  - measure: count
    type: count
    drill_fields: [id, provider_name]

