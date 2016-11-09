view: base_customcustomerlocation {
  sql_table_name: zinka.base_customcustomerlocation ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: custom_loc_field_id {
    type: number
    sql: ${TABLE}.custom_loc_field_id ;;
  }

  dimension: custom_location {
    type: string
    sql: ${TABLE}.custom_location ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: location_id {
    type: number
    sql: ${TABLE}.location_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
