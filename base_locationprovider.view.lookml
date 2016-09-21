- view: base_locationprovider
  sql_table_name: zinka.base_locationprovider
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: account
    type: string
    sql: ${TABLE}.account

  - dimension: is_active
    type: yesno
    sql: ${TABLE}.is_active

  - dimension: password
    type: string
    sql: ${TABLE}.password

  - dimension: url
    type: string
    sql: ${TABLE}.url

  - dimension: username
    type: string
    sql: ${TABLE}.username

  - dimension: vendor
    type: string
    sql: ${TABLE}.vendor

  - measure: count
    type: count
    drill_fields: [id, username]