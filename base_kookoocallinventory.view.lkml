view: base_kookoocallinventory {
  sql_table_name: zinka.base_kookoocallinventory ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: called_number {
    type: string
    sql: ${TABLE}.called_number ;;
  }

  dimension: caller_number {
    type: string
    sql: ${TABLE}.caller_number ;;
  }

  dimension_group: dt_added {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_added ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
