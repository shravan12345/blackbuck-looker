view: base_orderetahistory {
  sql_table_name: zinka.base_orderetahistory ;;

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

  dimension_group: location_update {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.location_update_time ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: revised_eta {
    type: time
    timeframes: [time, date, week, month, raw]
    sql: ${TABLE}.revised_eta ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

  dimension: latest_date {
    sql: MAX(${TABLE}.revised_eta) ;;
  }
}
