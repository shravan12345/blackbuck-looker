view: dlp_includedrateshistory {
  sql_table_name: zinka.dlp_includedrateshistory ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: added_by_id {
    type: number
    sql: ${TABLE}.added_by_id ;;
  }

  dimension: comments {
    type: string
    sql: ${TABLE}.comments ;;
  }

  dimension_group: end {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.end_time ;;
  }

  dimension: included_rates_id {
    type: number
    sql: ${TABLE}.included_rates_id ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active ;;
  }

  dimension: loading_rate {
    type: number
    sql: ${TABLE}.loading_rate ;;
  }

  dimension_group: start {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.start_time ;;
  }

  dimension: unloading_rate {
    type: number
    sql: ${TABLE}.unloading_rate ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
