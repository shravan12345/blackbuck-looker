view: base_statustransitionexpirytime {
  sql_table_name: zinka.base_statustransitionexpirytime ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: expiry_time {
    type: number
    sql: ${TABLE}.expiry_time ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
