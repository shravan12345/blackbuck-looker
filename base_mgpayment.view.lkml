view: base_mgpayment {
  sql_table_name: zinka.base_mgpayment ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: financial_transaction_id {
    type: number
    sql: ${TABLE}.financial_transaction_id ;;
  }

  dimension: sub_contract_id {
    type: number
    sql: ${TABLE}.sub_contract_id ;;
  }

  dimension: truck_id {
    type: number
    sql: ${TABLE}.truck_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
