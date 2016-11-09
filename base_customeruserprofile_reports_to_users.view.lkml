view: base_customeruserprofile_reports_to_users {
  sql_table_name: zinka.base_customeruserprofile_reports_to_users ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: customeruserprofile_id {
    type: number
    sql: ${TABLE}.customeruserprofile_id ;;
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
