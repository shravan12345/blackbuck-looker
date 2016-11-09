view: base_userprofile_preferred_lane {
  sql_table_name: zinka.base_userprofile_preferred_lane ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: lane_id {
    type: number
    sql: ${TABLE}.lane_id ;;
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
