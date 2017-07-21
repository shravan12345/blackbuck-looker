view: base_trucktonnage {
  sql_table_name: newbb.base_trucktonnage ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: tonnage_type {
    type: string
    sql: ${TABLE}.tonnage_type ;;
  }

  dimension: truck_tonnage {
    type: number
    sql: ${TABLE}.truck_tonnage ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
