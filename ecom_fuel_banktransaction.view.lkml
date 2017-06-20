view: ecom_fuel_banktransaction {
  sql_table_name: zinka.ecomFuel_banktransaction ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: amount_refund {
    type: number
    sql: ${TABLE}.amount_refund ;;
  }

  dimension_group: created {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_date ;;
  }

  dimension_group: dt_added {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_added ;;
  }

  dimension: error_code {
    type: string
    sql: ${TABLE}.error_code ;;
  }

  dimension: error_description {
    type: string
    sql: ${TABLE}.error_description ;;
  }

  dimension: fuel_transaction_id {
    type: string
    sql: ${TABLE}.fuel_transaction_id ;;
  }

  dimension: fuelcard_id {
    type: number
    sql: ${TABLE}.fuelcard_id ;;
  }

  dimension: payment_id {
    type: string
    sql: ${TABLE}.payment_id ;;
  }

  dimension: payment_mode {
    type: number
    sql: ${TABLE}.payment_mode ;;
  }

  dimension: refund_status {
    type: string
    sql: ${TABLE}.refund_status ;;
  }

  dimension: transaction_state {
    type: number
    sql: ${TABLE}.transaction_state ;;
  }

  measure: count_tran_nov {
    type: count
    drill_fields: [id,amount,dt_added_time]

    filters: {
      field: dt_added_month
      value: "2016/11"
    }

  }
  measure: count {
    type: count
  }


  measure: count_tran_dec {
    type: count
    drill_fields: [id,amount,dt_added_time]

    filters: {
      field: dt_added_month
      value: "2016/12"
    }

  }

  measure: sum_tran_nov {
    type: sum
    sql: ${amount} ;;
    drill_fields: [id,amount,dt_added_time]

    filters: {
      field: dt_added_month
      value: "2016/11"
    }
    }

    measure: sum_tran_dec {
      type: sum
      sql: ${amount} ;;
      drill_fields: [id,amount,dt_added_time]

      filters: {
        field: dt_added_month
        value: "2016/12"
      }

  }


}
