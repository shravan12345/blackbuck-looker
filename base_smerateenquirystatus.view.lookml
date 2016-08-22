- view: base_smerateenquirystatus
  sql_table_name: blackbuck_prod.base_smerateenquirystatus
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension_group: dt_added
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_added

  - dimension_group: dt_updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_updated

  - dimension: last_modified_by_id
    type: number
    sql: ${TABLE}.last_modified_by_id

  - dimension: sme_request_id
    type: number
    sql: ${TABLE}.sme_request_id

  - dimension: state
    type: number
    sql: ${TABLE}.state

  - measure: count
    type: count
    drill_fields: [id]

