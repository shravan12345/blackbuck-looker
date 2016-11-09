view: base_imei {
  sql_table_name: zinka.base_imei ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: date_added {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date_added ;;
  }

  dimension: imei {
    type: string
    sql: ${TABLE}.imei ;;
  }

  dimension: real_user {
    type: yesno
    sql: ${TABLE}.real_user ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
