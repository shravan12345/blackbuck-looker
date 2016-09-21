- view: base_truckdocuments
  sql_table_name: zinka.base_truckdocuments
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: document_type
    type: number
    sql: ${TABLE}.document_type

  - dimension_group: expiry
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.expiry_date

  - dimension: is_valid
    type: yesno
    sql: ${TABLE}.is_valid

  - dimension: last_modified_by_id
    type: number
    sql: ${TABLE}.last_modified_by_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified_date

  - dimension: last_verified_by_id
    type: number
    sql: ${TABLE}.last_verified_by_id

  - dimension_group: last_verified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_verified_date

  - dimension: truck_id
    type: number
    sql: ${TABLE}.truck_id

  - measure: count
    type: count
    drill_fields: [id]