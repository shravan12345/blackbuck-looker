- view: courier_track_envelopeinfohistory
  sql_table_name: zinka.courierTrack_envelopeinfohistory
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: courier_agency_id
    type: number
    sql: ${TABLE}.courier_agency_id

  - dimension: customer_id
    type: number
    sql: ${TABLE}.customer_id

  - dimension: docket_created_by_id
    type: number
    sql: ${TABLE}.docket_created_by_id

  - dimension: docket_entry_link
    type: string
    sql: ${TABLE}.docket_entry_Link

  - dimension_group: docket_entry
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.docket_entry_time

  - dimension: docket_number
    type: string
    sql: ${TABLE}.docket_number

  - dimension: envelop_created_by_id
    type: number
    sql: ${TABLE}.envelop_created_by_id

  - dimension_group: envelope_creation
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.envelope_creation_time

  - dimension: envelope_id
    type: number
    sql: ${TABLE}.envelope_id

  - dimension: envelope_status
    type: number
    sql: ${TABLE}.envelope_status

  - dimension_group: pickup
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.pickup_date

  - dimension: top_sheet_doc_link
    type: string
    sql: ${TABLE}.topSheet_doc_link

  - dimension_group: update
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.update_time

  - measure: count
    type: count
    drill_fields: [id]