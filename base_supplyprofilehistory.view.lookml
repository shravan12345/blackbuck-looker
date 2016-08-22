- view: base_supplyprofilehistory
  sql_table_name: blackbuck_prod.base_supplyprofilehistory
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: dnd
    type: yesno
    sql: ${TABLE}.dnd

  - dimension_group: dnd
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dnd_date

  - dimension: supply_profile_id
    type: number
    sql: ${TABLE}.supply_profile_id

  - measure: count
    type: count
    drill_fields: [id]

