- view: base_supplyprofile
  sql_table_name: blackbuck_prod.base_supplyprofile
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: comments
    type: string
    sql: ${TABLE}.comments

  - dimension: company
    type: string
    sql: ${TABLE}.company

  - dimension: company_address
    type: string
    sql: ${TABLE}.company_address

  - dimension: dnd
    type: yesno
    sql: ${TABLE}.dnd

  - dimension_group: dnd
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dnd_date

  - dimension: fleet_margin
    type: number
    sql: ${TABLE}.fleet_margin

  - dimension: home_location_id
    type: number
    sql: ${TABLE}.home_location_id

  - dimension: is_fleet_supply
    type: yesno
    sql: ${TABLE}.is_fleet_supply

  - dimension: language_id
    type: number
    sql: ${TABLE}.language_id

  - dimension: user_id
    type: number
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: [id]
    
    
  - dimension: Full_name
    type: string
    sql: CONCAT(${auth_user.first_name},'',${auth_user.last_name})

