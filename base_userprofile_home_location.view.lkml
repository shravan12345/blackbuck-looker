view: base_userprofile_home_location {
  sql_table_name: zinka.base_userprofile_home_location ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: location_id {
    type: number
    sql: ${TABLE}.location_id ;;
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
