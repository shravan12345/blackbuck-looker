view: base_trucktype_tonnage {
  sql_table_name: zinka.base_trucktype_tonnage ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: tonnage_id {
    type: number
    sql: ${TABLE}.tonnage_id ;;
  }

  dimension: trucktype_id {
    type: number
    sql: ${TABLE}.trucktype_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
