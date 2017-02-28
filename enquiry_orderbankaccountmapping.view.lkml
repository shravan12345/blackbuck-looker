view: enquiry_orderbankaccountmapping {
  sql_table_name: newbb.enquiry_orderbankaccountmapping ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: bank_account_id {
    type: number
    sql: ${TABLE}.bank_account_id ;;
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
