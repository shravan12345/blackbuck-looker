view: base_paymentdetails {
  sql_table_name: zinka.base_paymentdetails ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: acc_number {
    type: string
    sql: ${TABLE}.acc_number ;;
  }

  dimension: bank_address {
    type: string
    sql: ${TABLE}.bank_address ;;
  }

  dimension: bank_name {
    type: string
    sql: ${TABLE}.bank_name ;;
  }

  dimension: branch {
    type: string
    sql: ${TABLE}.branch ;;
  }

  dimension: ifsc_code {
    type: string
    sql: ${TABLE}.ifsc_code ;;
  }

  dimension: pan_card_no {
    type: string
    sql: ${TABLE}.pan_card_no ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, bank_name]
  }
}
