- view: base_ordereta
  sql_table_name: zinka.base_ordereta
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
    drill_fields: [order_id,eta_raw,eta_revised_view_raw]
    
  - dimension: deviation
    type: tier
    tiers: [0,24,48,72]
    sql: TIMESTAMPDIFF(hour,${eta_raw},${base_orderetahistory.latest_date})
    
  - dimension: deviation_transit
    type: number
    sql: IF(
             TIMESTAMPDIFF(hour,${eta_raw},${eta_revised_view.revised_eta_raw}) >= 0,TIMESTAMPDIFF(hour,${eta_raw},${eta_revised_view.revised_eta_raw}),null)
    value_format_name: decimal_0     
    
  - dimension: truck_in_transit_deviation
    type: tier
    tiers: [0,24,48,72]
    sql: ${deviation_transit}
