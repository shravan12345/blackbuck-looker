view: base_trucktype {
  sql_table_name: newbb.base_trucktype ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: tonnage {
    type: number
    sql: ${TABLE}.tonnage ;;
  }

  dimension: truck_type {
    type: string
    sql: ${TABLE}.truck_type ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
