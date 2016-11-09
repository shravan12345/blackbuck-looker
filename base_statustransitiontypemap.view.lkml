view: base_statustransitiontypemap {
  sql_table_name: zinka.base_statustransitiontypemap ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: event_name {
    type: string
    sql: ${TABLE}.event_name ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active ;;
  }

  dimension: is_visible_on_web {
    type: yesno
    sql: ${TABLE}.is_visible_on_web ;;
  }

  dimension: source_state {
    type: string
    sql: ${TABLE}.source_state ;;
  }

  dimension: transition_type {
    type: number
    sql: ${TABLE}.transition_type ;;
  }

  measure: count {
    type: count
    drill_fields: [id, event_name]
  }
}
