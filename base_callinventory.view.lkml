view: base_callinventory {
  sql_table_name: zinka.base_callinventory ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: agent_id {
    type: string
    sql: ${TABLE}.agent_id ;;
  }

  dimension: agent_name {
    type: string
    sql: ${TABLE}.agent_name ;;
  }

  dimension: agent_phone_number {
    type: string
    sql: ${TABLE}.agent_phone_number ;;
  }

  dimension: agent_status {
    type: string
    sql: ${TABLE}.agent_status ;;
  }

  dimension: agent_unique_id {
    type: string
    sql: ${TABLE}.agent_unique_id ;;
  }

  dimension: audio_file_link {
    type: string
    sql: ${TABLE}.audio_file_link ;;
  }

  dimension: call_duration {
    type: string
    sql: ${TABLE}.call_duration ;;
  }

  dimension_group: call_end {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.call_end_time ;;
  }

  dimension_group: call_start {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.call_start_time ;;
  }

  dimension: call_status {
    type: string
    sql: ${TABLE}.call_status ;;
  }

  dimension: call_transfer_type {
    type: string
    sql: ${TABLE}.call_transfer_type ;;
  }

  dimension: call_transferred_to {
    type: string
    sql: ${TABLE}.call_transferred_to ;;
  }

  dimension: call_type {
    type: string
    sql: ${TABLE}.call_type ;;
  }

  dimension: call_unique_id {
    type: string
    sql: ${TABLE}.call_unique_id ;;
  }

  dimension: caller_id {
    type: string
    sql: ${TABLE}.caller_id ;;
  }

  dimension: customer_status {
    type: string
    sql: ${TABLE}.customer_status ;;
  }

  dimension: dial_status {
    type: string
    sql: ${TABLE}.dial_status ;;
  }

  dimension: dialled_number {
    type: string
    sql: ${TABLE}.dialled_number ;;
  }

  dimension: did_no {
    type: string
    sql: ${TABLE}.did_no ;;
  }

  dimension: extra_info {
    type: string
    sql: ${TABLE}.extra_info ;;
  }

  dimension: fall_back_rule {
    type: string
    sql: ${TABLE}.fall_back_rule ;;
  }

  dimension: hangup_by {
    type: string
    sql: ${TABLE}.hangup_by ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: phone_name {
    type: string
    sql: ${TABLE}.phone_name ;;
  }

  dimension: queued_status {
    type: number
    sql: ${TABLE}.queued_status ;;
  }

  dimension: sno {
    type: string
    sql: ${TABLE}.sno ;;
  }

  dimension: time_to_answer {
    type: string
    sql: ${TABLE}.time_to_answer ;;
  }

  dimension: unique_id {
    type: string
    sql: ${TABLE}.unique_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, phone_name, agent_name]
  }
}
