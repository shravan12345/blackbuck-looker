view: base_truckbody {
  sql_table_name: newbb.base_truckbody ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: truck_body {
    type: string
    sql: ${TABLE}.truck_body ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
