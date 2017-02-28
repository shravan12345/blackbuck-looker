view: pricing_corprfqenquiresnew {
  sql_table_name: zinka.pricing_corprfqenquiresnew ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: approved {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.approved_at ;;
  }

  dimension: approved_by_id {
    type: number
    sql: ${TABLE}.approved_by_id ;;
  }

  dimension: approved_file {
    type: string
    sql: ${TABLE}.approved_file ;;
  }

  dimension_group: assigned {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.assigned_at ;;
  }

  dimension: assigned_to_id {
    type: number
    sql: ${TABLE}.assigned_to_id ;;
  }

  dimension: customer {
    type: string
    sql: ${TABLE}.customer ;;
  }

  dimension: enquired_by_id {
    type: number
    sql: ${TABLE}.enquired_by_id ;;
  }

  dimension: enquiry_file {
    type: string
    sql: ${TABLE}.enquiry_file ;;
  }

  dimension_group: enquiry {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.enquiry_time ;;
  }

  dimension: enquiry_type {
    type: number
    sql: ${TABLE}.enquiry_type ;;
  }

  dimension_group: expected {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.expected_time ;;
  }

  dimension: num_lanes {
    type: number
    sql: ${TABLE}.num_lanes ;;
  }

  dimension: practice_type {
    type: number
    sql: ${TABLE}.practice_type ;;
  }

  dimension: prices_file {
    type: string
    sql: ${TABLE}.prices_file ;;
  }

  dimension_group: pricing_deadline {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.pricing_deadline ;;
  }

  dimension: pricing_uploaded_file {
    type: string
    sql: ${TABLE}.pricing_uploaded_file ;;
  }

  dimension: rate_type {
    type: number
    sql: ${TABLE}.rate_type ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at ;;
  }

  dimension: updated_by_id {
    type: number
    sql: ${TABLE}.updated_by_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
