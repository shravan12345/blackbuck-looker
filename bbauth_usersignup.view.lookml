- view: bbauth_usersignup
  sql_table_name: blackbuck_prod.bbauth_usersignup
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: client_type
    type: number
    sql: ${TABLE}.client_type

  - dimension_group: dt_added
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_added

  - dimension: imei_id
    type: number
    sql: ${TABLE}.imei_id

  - dimension: mobile_number
    type: string
    sql: ${TABLE}.mobile_number

  - dimension: otp
    type: string
    sql: ${TABLE}.otp

  - dimension: otp_verified
    type: yesno
    sql: ${TABLE}.otp_verified

  - dimension: user_id
    type: number
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: [id]

