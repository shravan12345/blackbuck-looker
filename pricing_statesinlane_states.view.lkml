view: pricing_statesinlane_states {
  sql_table_name: zinka.pricing_statesinlane_states ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: state_id {
    type: number
    sql: ${TABLE}.state_id ;;
  }

  dimension: statesinlane_id {
    type: number
    sql: ${TABLE}.statesinlane_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
