view: enquiry_ordercollectionmapping {
  sql_table_name: newbb.enquiry_ordercollectionmapping ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: order_collection_id {
    type: number
    sql: ${TABLE}.order_collection_id ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: payment_amount {
    type: number
    sql: ${TABLE}.payment_amount ;;
  }

  dimension: payment_type {
    type: number
    sql: ${TABLE}.payment_type ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
