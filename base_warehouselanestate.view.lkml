view: base_warehouselanestate {
  sql_table_name: zinka.base_warehouselanestate ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: state_id {
    type: number
    sql: ${TABLE}.state_id ;;
  }

  dimension: warehouselane_id {
    type: number
    sql: ${TABLE}.warehouselane_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
