view: base_userprofile_operating_zones {
  sql_table_name: zinka.base_userprofile_operating_zones ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: userprofile_id {
    type: number
    sql: ${TABLE}.userprofile_id ;;
  }

  dimension: zone_id {
    type: number
    sql: ${TABLE}.zone_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
