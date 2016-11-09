view: base_userprofile_preferred_location {
  sql_table_name: zinka.base_userprofile_preferred_location ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: userprofile_id {
    type: number
    sql: ${TABLE}.userprofile_id ;;
  }

  dimension: warehouse_id {
    type: number
    sql: ${TABLE}.warehouse_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
