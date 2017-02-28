view: base_truckvicinitynotification {
  sql_table_name: zinka.base_truckvicinitynotification ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: is_arrival_notified {
    type: yesno
    sql: ${TABLE}.is_arrival_notified ;;
  }

  dimension: is_departure_notified {
    type: yesno
    sql: ${TABLE}.is_departure_notified ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
