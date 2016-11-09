view: base_ownerfeedback {
  sql_table_name: zinka.base_ownerfeedback ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: additional_info {
    type: string
    sql: ${TABLE}.additional_info ;;
  }

  dimension: comment {
    type: number
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

  dimension_group: dt_updated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_updated ;;
  }

  dimension: supplier_id {
    type: number
    sql: ${TABLE}.supplier_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
