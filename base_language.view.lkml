view: base_language {
  sql_table_name: zinka.base_language ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: language {
    type: string
    sql: ${TABLE}.language ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
