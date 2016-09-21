- view: base_userprofile
  sql_table_name: zinka.base_userprofile
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: address
    type: string
    sql: ${TABLE}.address

  - dimension: bank_account_name
    type: string
    sql: ${TABLE}.bank_account_name

  - dimension: bank_account_number
    type: string
    sql: ${TABLE}.bank_account_number

  - dimension: bank_ifsc_code
    type: string
    sql: ${TABLE}.bank_ifsc_code

  - dimension: city
    type: string
    sql: ${TABLE}.city

  - dimension: company_name
    type: string
    sql: ${TABLE}.company_name

  - dimension: company_type
    type: number
    sql: ${TABLE}.company_type

  - dimension: company_type_others
    type: string
    sql: ${TABLE}.company_type_others

  - dimension: country
    type: string
    sql: ${TABLE}.country

  - dimension: created_by_id
    type: number
    sql: ${TABLE}.created_by_id

  - dimension: customer_id
    type: number
    sql: ${TABLE}.customer_id

  - dimension_group: dob
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.dob

  - dimension: functions
    type: string
    sql: ${TABLE}.functions

  - dimension: is_blocked
    type: yesno
    sql: ${TABLE}.is_blocked

  - dimension: is_intracity
    type: yesno
    sql: ${TABLE}.is_intracity

  - dimension: last_modified_by_id
    type: number
    sql: ${TABLE}.last_modified_by_id

  - dimension: mobile1
    type: string
    sql: ${TABLE}.mobile1

  - dimension: mobile2
    type: string
    sql: ${TABLE}.mobile2

  - dimension: pan_image
    type: string
    sql: ${TABLE}.pan_image

  - dimension: pan_number
    type: string
    sql: ${TABLE}.pan_number

  - dimension: profile_image
    type: string
    sql: ${TABLE}.profile_image

  - dimension: quality
    type: string
    sql: ${TABLE}.quality

  - dimension: sex
    type: string
    sql: ${TABLE}.sex

  - dimension: state
    type: string
    sql: ${TABLE}.state

  - dimension: tds_image
    type: string
    sql: ${TABLE}.tds_image

  - dimension: user_id
    type: number
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: [id, bank_account_name, company_name]