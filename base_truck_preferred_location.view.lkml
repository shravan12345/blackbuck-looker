view: base_truck_preferred_location {
  sql_table_name: zinka.base_truck_preferred_location ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: location_id {
    type: number
    sql: ${TABLE}.location_id ;;
  }

  dimension: truck_id {
    type: number
    sql: ${TABLE}.truck_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
