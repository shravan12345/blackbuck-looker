- view: base_servicetax
  sql_table_name: zinka.base_servicetax
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: abatement_pct
    type: number
    sql: ${TABLE}.abatement_pct

  - dimension_group: end
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.end_date

  - dimension: service_tax_pct
    type: number
    sql: ${TABLE}.service_tax_pct

  - dimension_group: start
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.start_date

  - measure: count
    type: count
    drill_fields: [id]