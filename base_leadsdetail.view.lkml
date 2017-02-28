view: base_leadsdetail {
  sql_table_name: zinka.base_leadsdetail ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: call_later {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.call_later_date ;;
  }

  dimension: converted_owner_id {
    type: number
    sql: ${TABLE}.converted_owner_id ;;
  }

  dimension_group: dt_added {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_added ;;
  }

  dimension: language_id {
    type: number
    sql: ${TABLE}.language_id ;;
  }

  dimension_group: last_modified {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension: lead_group_id {
    type: number
    sql: ${TABLE}.lead_group_id ;;
  }

  dimension: lead_provider {
    type: number
    sql: ${TABLE}.lead_provider ;;
  }

  dimension: lead_provider_user_id {
    type: number
    sql: ${TABLE}.lead_provider_user_id ;;
  }

  dimension: location_id {
    type: number
    sql: ${TABLE}.location_id ;;
  }

  dimension: origin_file_name {
    type: string
    sql: ${TABLE}.origin_file_name ;;
  }

  dimension: owner_alt_mobile {
    type: string
    sql: ${TABLE}.owner_alt_mobile ;;
  }

  dimension: owner_mobile {
    type: string
    sql: ${TABLE}.owner_mobile ;;
  }

  dimension: remarks {
    type: string
    sql: ${TABLE}.remarks ;;
  }

  dimension: smartphone_number {
    type: string
    sql: ${TABLE}.smartphone_number ;;
  }

  dimension: smartphone_present {
    type: number
    sql: ${TABLE}.smartphone_present ;;
  }

  dimension: sre_id {
    type: number
    sql: ${TABLE}.sre_id ;;
  }

  dimension: state_id {
    type: number
    sql: ${TABLE}.state_id ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
  }

  dimension: truck_owner_name {
    type: string
    sql: ${TABLE}.truck_owner_name ;;
  }

  dimension: truck_reg_numbers {
    type: string
    sql: ${TABLE}.truck_reg_numbers ;;
  }

  measure: count {
    type: count
    drill_fields: [id, truck_owner_name, origin_file_name]
  }
}
