view: base_userprofile_to_state_preferences {
  sql_table_name: newbb.base_userprofile_to_state_preferences ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: googleplaces_id {
    type: number
    sql: ${TABLE}.googleplaces_id ;;
  }

  dimension: userprofile_id {
    type: number
    sql: ${TABLE}.userprofile_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
