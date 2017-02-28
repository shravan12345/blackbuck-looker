view: enquiry_ordertruckmappingdocsmapping {
  sql_table_name: newbb.enquiry_ordertruckmappingdocsmapping ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: docs_id {
    type: number
    sql: ${TABLE}.docs_id ;;
  }

  dimension: is_verified {
    type: yesno
    sql: ${TABLE}.is_verified ;;
  }

  dimension: order_truck_id {
    type: number
    sql: ${TABLE}.order_truck_id ;;
  }

  dimension: remarks {
    type: number
    sql: ${TABLE}.remarks ;;
  }

  dimension: verified_by_id {
    type: number
    sql: ${TABLE}.verified_by_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
