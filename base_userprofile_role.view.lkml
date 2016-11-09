view: base_userprofile_role {
  sql_table_name: zinka.base_userprofile_role ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: role_id {
    type: number
    sql: ${TABLE}.role_id ;;
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
