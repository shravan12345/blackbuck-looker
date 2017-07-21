view: payment_ordercollection {
  sql_table_name: newbb.payment_ordercollection ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: customer_email {
    type: string
    sql: ${TABLE}.customer_email ;;
  }

  dimension: customer_name {
    type: string
    sql: ${TABLE}.customer_name ;;
  }

  dimension: customer_phone {
    type: string
    sql: ${TABLE}.customer_phone ;;
  }

  dimension: note {
    type: string
    sql: ${TABLE}.note ;;
  }

  dimension: pattern_code {
    type: string
    sql: ${TABLE}.pattern_code ;;
  }

  dimension: seller_phone_num {
    type: string
    sql: ${TABLE}.seller_phone_num ;;
  }

  dimension: total_order_amount {
    type: number
    sql: ${TABLE}.total_order_amount ;;
  }

  measure: count {
    type: count
    drill_fields: [id, customer_name]
  }
}
