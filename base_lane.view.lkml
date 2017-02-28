view: base_lane {
  sql_table_name: newbb.base_lane ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: from_location_id {
    type: number
    sql: ${TABLE}.from_location_id ;;
  }

  dimension: to_location_id {
    type: number
    sql: ${TABLE}.to_location_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
