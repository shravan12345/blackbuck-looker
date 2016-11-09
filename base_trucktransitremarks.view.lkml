view: base_trucktransitremarks {
  sql_table_name: zinka.base_trucktransitremarks ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: comment {
    type: string
    sql: ${TABLE}.comment ;;
  }

  dimension: created_by_id {
    type: number
    sql: ${TABLE}.created_by_id ;;
  }

  dimension_group: dt_added {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_added ;;
  }

  dimension: truck_id {
    type: number
    sql: ${TABLE}.truck_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
