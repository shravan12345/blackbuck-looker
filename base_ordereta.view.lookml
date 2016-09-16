- view: base_ordereta
  sql_table_name: blackbuck_prod.base_ordereta
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension_group: dt_added
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_added

  - dimension_group: eta
    type: time
    timeframes: [time, date, week, month,raw]
    sql: ${TABLE}.eta

  - dimension: order_id
    type: number
    sql: ${TABLE}.order_id

  - measure: count
    type: count
    drill_fields: [id]
    
  - dimension: deviation
    type: tier
    tiers: [0,24,48,72]
    sql: TIMESTAMPDIFF(hour,${eta_raw},${base_orderetahistory.latest_date})

