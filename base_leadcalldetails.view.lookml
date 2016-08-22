- view: base_leadcalldetails
  sql_table_name: blackbuck_prod.base_leadcalldetails
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: call_data_id
    type: number
    sql: ${TABLE}.call_data_id

  - dimension: lead_detail_id
    type: number
    sql: ${TABLE}.lead_detail_id

  - dimension: remarks
    type: string
    sql: ${TABLE}.remarks

  - measure: count
    type: count
    drill_fields: [id]

