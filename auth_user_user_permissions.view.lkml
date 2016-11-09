view: auth_user_user_permissions {
  sql_table_name: zinka.auth_user_user_permissions ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: permission_id {
    type: number
    sql: ${TABLE}.permission_id ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
