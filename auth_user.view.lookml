- view: auth_user
  sql_table_name: zinka.auth_user
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id
  

  - dimension_group: date_joined
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date_joined
    hidden: true

  - dimension: email
    type: string
    sql: ${TABLE}.email
    hidden: true

  - dimension: first_name
    type: string
    sql: ${TABLE}.first_name

  - dimension: is_active
    type: yesno
    sql: ${TABLE}.is_active
    hidden: true

  - dimension: is_staff
    type: yesno
    sql: ${TABLE}.is_staff
    hidden: true

  - dimension: is_superuser
    type: yesno
    sql: ${TABLE}.is_superuser
    hidden: true

  - dimension_group: last_login
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_login
    hidden: true

  - dimension: last_name
    type: string
    sql: ${TABLE}.last_name

  - dimension: password
    type: string
    sql: ${TABLE}.password
    hidden: true

  - dimension: username
    type: string
    sql: ${TABLE}.username
    hidden: true

  - measure: count
    type: count
    drill_fields: [id, username, first_name, last_name]
    
  - dimension: full_name
    type: string
    sql: CONCAT(${first_name},'',${last_name})