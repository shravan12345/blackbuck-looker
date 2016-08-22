- view: base_adcampaigntracking
  sql_table_name: blackbuck_prod.base_adcampaigntracking
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

  - dimension: user_id
    type: number
    sql: ${TABLE}.user_id

  - dimension: utm_campaign
    type: string
    sql: ${TABLE}.utm_campaign

  - dimension: utm_content
    type: string
    sql: ${TABLE}.utm_content

  - dimension: utm_medium
    type: string
    sql: ${TABLE}.utm_medium

  - dimension: utm_source
    type: string
    sql: ${TABLE}.utm_source

  - dimension: utm_term
    type: string
    sql: ${TABLE}.utm_term

  - measure: count
    type: count
    drill_fields: [id]

