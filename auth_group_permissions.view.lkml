view: auth_group_permissions {

  sql_table_name: zinka.auth_group_permissions ;;


  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: group_id {
    type: number
    sql: ${TABLE}.group_id ;;
  }

  dimension: permission_id {
    type: number
    sql: ${TABLE}.permission_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
