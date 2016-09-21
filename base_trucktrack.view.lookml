- view: base_trucktrack
  sql_table_name: zinka.base_trucktrack
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: blocked_caller_id
    type: number
    sql: ${TABLE}.blocked_caller_id

  - dimension: call_status
    type: number
    sql: ${TABLE}.call_status

  - dimension_group: end_track
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.end_track_date

  - dimension: is_blocked
    type: yesno
    sql: ${TABLE}.is_blocked

  - dimension: is_complete
    type: yesno
    sql: ${TABLE}.is_complete

  - dimension_group: next_call
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.next_call_time

  - dimension: order_id
    type: number
    sql: ${TABLE}.order_id

  - dimension: pod_give_to
    type: number
    sql: ${TABLE}.pod_give_to

  - dimension: pod_mode
    type: number
    sql: ${TABLE}.pod_mode

  - dimension_group: pod_reach
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.pod_reach_time

  - dimension: secondary_status
    type: number
    sql: ${TABLE}.secondary_status

  - dimension_group: start_track
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.start_track_date

  - dimension_group: truck_loading
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.truck_loading_time

  - dimension_group: truck_unloading
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.truck_unloading_time

  - dimension_group: update
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.update_time

  - measure: count
    type: count
    drill_fields: [id]