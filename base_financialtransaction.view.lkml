view: base_financialtransaction {
  sql_table_name: zinka.base_financialtransaction ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: beneficiary_acc_num {
    type: string
    sql: ${TABLE}.beneficiary_acc_num ;;
  }

  dimension: beneficiary_ifsc {
    type: string
    sql: ${TABLE}.beneficiary_ifsc ;;
  }

  dimension: beneficiary_name {
    type: string
    sql: ${TABLE}.beneficiary_name ;;
  }

  dimension: beneficiary_user_id {
    type: number
    sql: ${TABLE}.beneficiary_user_id ;;
  }

  dimension: bonus {
    type: number
    sql: ${TABLE}.bonus ;;
  }

  dimension: comments {
    type: string
    sql: ${TABLE}.comments ;;
  }

  dimension_group: date_of_transaction {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date_of_transaction ;;
  }

  dimension: entity_id {
    type: string
    sql: ${TABLE}.entity_id ;;
  }

  dimension_group: expiration {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.expiration ;;
  }

  dimension: failure_reason {
    type: number
    sql: ${TABLE}.failure_reason ;;
  }

  dimension: fuel_partner_id {
    type: number
    sql: ${TABLE}.fuel_partner_id ;;
  }

  dimension: num_otp_regeneration {
    type: number
    sql: ${TABLE}.num_otp_regeneration ;;
  }

  dimension: num_otp_retries {
    type: number
    sql: ${TABLE}.num_otp_retries ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: otp {
    type: string
    sql: ${TABLE}.otp ;;
  }

  dimension_group: otp_expiration {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.otp_expiration ;;
  }

  dimension: payment_mode {
    type: number
    sql: ${TABLE}.payment_mode ;;
  }

  dimension: payment_reason {
    type: number
    sql: ${TABLE}.payment_reason ;;
  }

  dimension: returned_beneficiary_name {
    type: string
    sql: ${TABLE}.returned_beneficiary_name ;;
  }

  dimension: state {
    type: number
    sql: ${TABLE}.state ;;
  }

  dimension: transaction_bank_id {
    type: number
    sql: ${TABLE}.transaction_bank_id ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, beneficiary_name, returned_beneficiary_name]
  }

  measure: advance_paid  {
    type: sum
    sql: ${TABLE}.amount ;;
  }
  measure: fuel_advance_ordercount  {
    type: sum
    sql: CASE WHEN ${fuel_partner_id} IS NOT NULL AND ${state} = 2 AND ${payment_reason} = 0 THEN 1 ELSE 0 END ;;
  }
  measure: advance_orderscount {
    type:  count_distinct
    sql:  CASE WHEN ${state} = 2 AND ${payment_reason} = 0 THEN ${order_id} ELSE NULL END  ;;
  }
}
