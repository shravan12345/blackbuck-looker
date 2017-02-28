view: base_userprofile_work_location {
  sql_table_name: newbb.base_userprofile_work_location ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: clusterlocalityinfo_id {
    type: number
    sql: ${TABLE}.clusterlocalityinfo_id ;;
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
