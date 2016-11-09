view: base_leadstatus {
  sql_table_name: zinka.base_leadstatus ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: dt_added {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_added ;;
  }

  dimension_group: dt_updated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_updated ;;
  }

  dimension: last_modified_by_id {
    type: number
    sql: ${TABLE}.last_modified_by_id ;;
  }

  dimension: lead_id {
    type: number
    sql: ${TABLE}.lead_id ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
