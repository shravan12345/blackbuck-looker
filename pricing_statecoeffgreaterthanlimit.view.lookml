- view: pricing_statecoeffgreaterthanlimit
  sql_table_name: blackbuck_prod.pricing_statecoeffgreaterthanlimit
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: best_value_coefficient
    type: number
    sql: ${TABLE}.best_value_coefficient

  - dimension: percentile_max_value_coefficient
    type: number
    sql: ${TABLE}.percentile_max_value_coefficient

  - dimension: percentile_min_value_coefficient
    type: number
    sql: ${TABLE}.percentile_min_value_coefficient

  - dimension: state_id
    type: number
    sql: ${TABLE}.state_id

  - measure: count
    type: count
    drill_fields: [id]

