- view: base_trucktrackstatus
  sql_table_name: blackbuck_prod.base_trucktrackstatus
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: botcall_status
    type: number
    sql: ${TABLE}.botcall_status

  - dimension: call_id
    type: number
    sql: ${TABLE}.call_id

  - dimension: call_status
    type: number
    sql: ${TABLE}.call_status

  - dimension: calldetail_id
    type: string
    sql: ${TABLE}.calldetail_id

  - dimension: called_by
    type: string
    sql: ${TABLE}.called_by

  - dimension: called_to
    type: string
    sql: ${TABLE}.called_to

  - dimension: caller_id
    type: number
    sql: ${TABLE}.caller_id

  - dimension: comments
    type: string
    sql: ${TABLE}.comments

  - dimension_group: dt_added
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_added

  - dimension: google_place_id
    type: string
    sql: ${TABLE}.google_place_id

  - dimension: location_comments
    type: string
    sql: ${TABLE}.location_comments

  - dimension: order_id
    type: number
    sql: ${TABLE}.order_id

  - dimension: secondary_status
    type: number
    sql: ${TABLE}.secondary_status

  - dimension: truck_track_id
    type: number
    sql: ${TABLE}.truck_track_id

  - measure: count
    type: count
    drill_fields: [id]

