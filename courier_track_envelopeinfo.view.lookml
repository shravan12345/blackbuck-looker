- view: courier_track_envelopeinfo
  sql_table_name: zinka.courierTrack_envelopeinfo
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

  - dimension: envelope_status
    type: number
    sql: ${TABLE}.envelope_status

  - dimension: is_cancelled
    type: yesno
    sql: ${TABLE}.is_cancelled

  - dimension_group: pickup
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.pickup_date

  - dimension: top_sheet_doc_link
    type: string
    sql: ${TABLE}.topSheet_doc_link

  - measure: count
    type: count
    drill_fields: [id]