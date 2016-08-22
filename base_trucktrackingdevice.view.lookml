- view: base_trucktrackingdevice
  sql_table_name: blackbuck_prod.base_trucktrackingdevice
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: created_by_id
    type: number
    sql: ${TABLE}.created_by_id

  - dimension_group: dt_added
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_added

  - dimension_group: dt_updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_updated

  - dimension_group: end
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.end_date

  - dimension: is_timely_tracking
    type: yesno
    sql: ${TABLE}.is_timely_tracking

  - dimension: msisdn
    type: string
    sql: ${TABLE}.msisdn

  - dimension: shipment
    type: string
    sql: ${TABLE}.shipment

  - dimension_group: start
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.start_date

  - dimension: truck_id
    type: number
    sql: ${TABLE}.truck_id

  - dimension: vendor_type
    type: number
    sql: ${TABLE}.vendor_type

  - measure: count
    type: count
    drill_fields: [id]

