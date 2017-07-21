view: base_orderfinancedetails {
  sql_table_name: zinka.base_orderfinancedetails ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: advance_cash_amount {
    type: number
    sql: ${TABLE}.advance_cash_amount ;;
  }

  dimension: advance_cash_paid {
    type: yesno
    sql: ${TABLE}.advance_cash_paid ;;
  }

  dimension: advance_channel {
    type: number
    sql: ${TABLE}.advance_channel ;;
  }

  dimension: advance_etransfer_amount {
    type: number
    sql: ${TABLE}.advance_etransfer_amount ;;
  }

  dimension: advance_etransfer_paid {
    type: yesno
    sql: ${TABLE}.advance_etransfer_paid ;;
  }

  dimension: advance_fuel_amount {
    type: number
    sql: ${TABLE}.advance_fuel_amount ;;
  }

  dimension: advance_fuel_paid {
    type: yesno
    sql: ${TABLE}.advance_fuel_paid ;;
  }

  dimension: advance_fuel_percentage {
    type: number
    sql: ${TABLE}.advance_fuel_percentage ;;
  }

  dimension: advance_payment_method_id {
    type: number
    sql: ${TABLE}.advance_payment_method_id ;;
  }

  dimension: advance_voucher_image {
    type: string
    sql: ${TABLE}.advance_voucher_image ;;
  }

  dimension: bonus_amount {
    type: number
    sql: ${TABLE}.bonus_amount ;;
  }

  dimension: checkpost_bills_images {
    type: string
    sql: ${TABLE}.checkpost_bills_images ;;
  }

  dimension: consignment_note_images {
    type: string
    sql: ${TABLE}.consignment_note_images ;;
  }

  dimension: damage_recovered_amount {
    type: number
    sql: ${TABLE}.damage_recovered_amount ;;
  }

  dimension: damage_recovered_type {
    type: number
    sql: ${TABLE}.damage_recovered_type ;;
  }

  dimension: damages {
    type: number
    sql: ${TABLE}.damages ;;
  }

  dimension: dest_halt_charges {
    type: number
    sql: ${TABLE}.dest_halt_charges ;;
  }

  dimension: dest_halt_duration {
    type: number
    sql: ${TABLE}.dest_halt_duration ;;
  }

  dimension: dest_halt_reason {
    type: number
    sql: ${TABLE}.dest_halt_reason ;;
  }

  dimension: dest_misc_comments {
    type: string
    sql: ${TABLE}.dest_misc_comments ;;
  }

  dimension: equivalent_weight {
    type: number
    sql: ${TABLE}.equivalent_weight ;;
  }

  dimension: freight_amount {
    type: number
    sql: ${TABLE}.freight_amount ;;
  }

  dimension: halt_charges {
    type: number
    sql: ${TABLE}.halt_charges ;;
  }

  dimension: halt_duration {
    type: number
    sql: ${TABLE}.halt_duration ;;
  }

  dimension: halt_reason {
    type: number
    sql: ${TABLE}.halt_reason ;;
  }

  dimension: included_loading_charges {
    type: number
    sql: ${TABLE}.included_loading_charges ;;
  }

  dimension: included_unloading_charges {
    type: number
    sql: ${TABLE}.included_unloading_charges ;;
  }

  dimension: invoice_images {
    type: string
    sql: ${TABLE}.invoice_images ;;
  }

  dimension: loading_charges {
    type: number
    sql: ${TABLE}.loading_charges ;;
  }

  dimension: lr_image {
    type: string
    sql: ${TABLE}.lr_image ;;
  }

  dimension: lr_number {
    type: string
    sql: ${TABLE}.lr_number ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: pod_images {
    type: string
    sql: ${TABLE}.pod_images ;;
  }

  dimension: settlement_cash_amount {
    type: number
    sql: ${TABLE}.settlement_cash_amount ;;
  }

  dimension: settlement_cash_paid {
    type: yesno
    sql: ${TABLE}.settlement_cash_paid ;;
  }

  dimension: settlement_channel {
    type: number
    sql: ${TABLE}.settlement_channel ;;
  }

  dimension: settlement_etransfer_amount {
    type: number
    sql: ${TABLE}.settlement_etransfer_amount ;;
  }

  dimension: settlement_etransfer_paid {
    type: yesno
    sql: ${TABLE}.settlement_etransfer_paid ;;
  }

  dimension: settlement_payment_method_id {
    type: number
    sql: ${TABLE}.settlement_payment_method_id ;;
  }

  dimension: settlement_voucher_image {
    type: string
    sql: ${TABLE}.settlement_voucher_image ;;
  }

  dimension: source_misc_comments {
    type: string
    sql: ${TABLE}.source_misc_comments ;;
  }

  dimension: total_amount {
    type: number
    sql: ${TABLE}.total_amount ;;
  }

  dimension: total_dest_misc_charges {
    type: number
    sql: ${TABLE}.total_dest_misc_charges ;;
  }

  dimension: total_source_misc_charges {
    type: number
    sql: ${TABLE}.total_source_misc_charges ;;
  }

  dimension: unloading_charges {
    type: number
    sql: ${TABLE}.unloading_charges ;;
  }

  measure: count {
    type: count
    drill_fields: [order_id,base_order.status,base_order.settlment_document_status]
  }

  measure: Avg_Freight {
    type: average
    sql: ${TABLE}.freight_amount + ${TABLE}.loading_charges + NULLIF(${TABLE}.unloading_charges,0) + ${TABLE}.halt_charges ;;
    drill_fields: [order_id, base_order.user_id, base_order.start_date, base_order.end_date, base_order.status, From_City.city, To_city.city, freight_amount]
  }

  dimension: Fuel_Percentage {
    type: number
    sql: 100*${advance_fuel_amount}/${freight_amount} ;;
    value_format_name: decimal_2
  }

  measure: Fuel_Percentage_Count {
    type: count_distinct
    sql: ${order_id} ;;

    filters: {
      field: Fuel_Percentage
      value: ">=30"
    }

    drill_fields: [order_id, Fuel_Percentage]
  }

  measure: average_damage_month {
    type: average
    sql: IF ( ${damages} > 0 ,${damages},null) ;;
    value_format_name: decimal_1

    filters: {
      field: base_order.end_date
      value: "45 days ago for 30 days"
    }

    drill_fields: [order_id, damages]
  }

  measure: average_detention_month {
    type: average
    sql: IF(${TABLE}.halt_charges > 0 ,${TABLE}.halt_charges,null) + IF(${TABLE}.dest_halt_charges > 0 ,${TABLE}.dest_halt_charges,null) ;;
    value_format_name: decimal_1

    filters: {
      field: base_order.end_date
      value: "45 days ago for 30 days"
    }

    drill_fields: [order_id, halt_charges, dest_halt_charges]
  }

  measure: full_amount {
    type:  sum
    sql:  ${total_amount} ;;

  }

  measure:  fs_pending {
    type: sum
    sql: ${total_amount} - (${advance_cash_amount} + ${advance_etransfer_amount} + ${settlement_cash_amount}+${settlement_etransfer_amount}+${advance_fuel_amount} + ${dest_halt_charges} + ${loading_charges}+${unloading_charges} + ${halt_charges});;
  }

  measure: Average_Loading  {
    type: average
    sql: NULLIF(${loading_charges},0);;
    drill_fields: [order_id,loading_charges]
  }

  measure: Average_Unloading {
    type: average
    sql: NULLIF(${unloading_charges},0) ;;
    drill_fields: [order_id,unloading_charges]
  }

  measure: Average_Cash_advance {
    type: average
    sql: NULLIF(${advance_cash_amount},0) ;;
    drill_fields: [order_id , advance_cash_amount]
  }
  measure: Fuel_Advance_Ordercount {
    type: sum
    sql: CASE WHEN ${advance_fuel_amount} > 0 THEN 1 ELSE 0 END  ;;
    drill_fields: [order_id , advance_fuel_amount]
  }
  measure: Count_OrderID {
    type: count_distinct
    sql: ${order_id} ;;
    drill_fields: [order_id , advance_fuel_amount]
  }
}
