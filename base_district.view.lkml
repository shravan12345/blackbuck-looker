view: base_district {
  sql_table_name: zinka.base_district ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: google_place_id {
    type: number
    sql: ${TABLE}.google_place_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: state_id {
    type: number
    sql: ${TABLE}.state_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
