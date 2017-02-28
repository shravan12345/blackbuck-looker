view: base_lane {

  sql_table_name: zinka.base_lane ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: destination1_id {
    type: number
    sql: ${TABLE}.destination1_id ;;
  }

  dimension: destination2_id {
    type: number
    sql: ${TABLE}.destination2_id ;;

  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
