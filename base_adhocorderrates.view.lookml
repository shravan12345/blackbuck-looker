- view: base_adhocorderrates
  sql_table_name: zinka.base_adhocorderrates
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: adhoc_rate
    type: number
    sql: ${TABLE}.adhoc_rate

  - dimension: customer_id
    type: number
    sql: ${TABLE}.customer_id

  - dimension: multiple_loading_charges
    type: number
    sql: ${TABLE}.multiple_loading_charges

  - dimension: multiple_unloading_charges
    type: number
    sql: ${TABLE}.multiple_unloading_charges

  - dimension: rate_type
    type: number
    sql: ${TABLE}.rate_type

  - measure: count
    type: count
    drill_fields: [id]