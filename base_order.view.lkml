view: base_order {
  sql_table_name: zinka.base_order ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: accepted_by {
    type: number
    sql: ${TABLE}.accepted_by ;;
  }

  dimension: accepted_by_imei_id {
    type: number
    sql: ${TABLE}.accepted_by_imei_id ;;
    hidden: yes
  }

  dimension: adhoc_rate {
    type: number
    sql: ${TABLE}.adhoc_rate ;;
    hidden: yes
  }

  dimension: adhoc_rate_reference_id {
    type: number
    sql: ${TABLE}.adhoc_rate_reference_id ;;
    hidden: yes
  }

  dimension: app_accepted_account_id {
    type: number
    sql: ${TABLE}.app_accepted_account_id ;;
  }

  dimension: assigned_driver_id {
    type: number
    sql: ${TABLE}.assigned_driver_id ;;
    hidden: yes
  }

  dimension: assigned_truck_id {
    type: number
    sql: ${TABLE}.assigned_truck_id ;;
  }

  dimension: bill_exchange_reqd {
    type: yesno
    sql: ${TABLE}.bill_exchange_reqd ;;
    hidden: yes
  }

  dimension: bonus_amount {
    type: number
    sql: ${TABLE}.bonus_amount ;;
    hidden: yes
  }

  dimension: sp_name {
    type: string
    sql: CASE WHEN ${supply_partner_id} IS NOT NULL THEN ${auth_user.full_name} ELSE NULL END ;;
    full_suggestions: yes
  }

  dimension: bonus_scheme_id {
    type: number
    sql: ${TABLE}.bonus_scheme_id ;;
    hidden: yes
  }

  dimension: broker_id {
    type: number
    sql: ${TABLE}.broker_id ;;
    hidden: yes
  }

  dimension: cancel_reason_id {
    type: number
    sql: ${TABLE}.cancel_reason_id ;;
  }

  dimension: contracted_rate_id {
    type: number
    sql: ${TABLE}.contracted_rate_id ;;
    hidden: yes
  }

  dimension: created_by_id {
    type: number
    sql: ${TABLE}.created_by_id ;;
    hidden: yes
  }

  dimension: custom_requirements {
    type: string
    sql: ${TABLE}.custom_requirements ;;
    hidden: yes
  }

  dimension: customer_order_id {
    type: number
    sql: ${TABLE}.customer_order_id ;;
    hidden: yes
  }

  dimension: cutoff_duration {
    type: number
    sql: ${TABLE}.cutoff_duration ;;
    hidden: yes
  }

  dimension: discount_percentage {
    type: number
    sql: ${TABLE}.discount_percentage ;;
    hidden: yes
  }

  dimension: distance {
    type: number
    sql: ${TABLE}.distance ;;
  }

  dimension_group: end {
    type: time
    timeframes: [time, date, week, month, hour, hour_of_day, raw, day_of_week]
    sql: ${TABLE}.end_date ;;
  }

  dimension: end_location_id {
    type: number
    sql: ${TABLE}.end_location_id ;;
    hidden: yes
  }

  dimension_group: expiry {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.expiry_date ;;
    hidden: yes
  }

  dimension: fleet_supply_partner_id {
    type: number
    sql: ${TABLE}.fleet_supply_partner_id ;;
  }

  dimension: from_city_id {
    type: number
    sql: ${TABLE}.from_city_id ;;
    hidden: yes
  }

  dimension: invoice_images {
    type: string
    sql: ${TABLE}.invoice_images ;;
    hidden: yes
  }

  dimension: lane_id {
    type: number
    sql: ${TABLE}.lane_id ;;
  }

  dimension: manual_placement {
    type: yesno
    sql: ${TABLE}.manual_placement ;;
  }

  dimension: market_price {
    type: string
    sql: ${TABLE}.market_price ;;
    hidden: yes
  }

  dimension: material_mvmt_type {
    type: number
    sql: ${TABLE}.material_mvmt_type ;;
    hidden: yes
  }

  dimension: mg_contract_id {
    type: number
    sql: ${TABLE}.mg_contract_id ;;
  }

  dimension: mode_of_payment {
    type: number
    sql: ${TABLE}.mode_of_payment ;;
  }

  dimension: no_outlets {
    type: number
    sql: ${TABLE}.no_outlets ;;
    hidden: yes
  }

  dimension: no_trips {
    type: number
    sql: ${TABLE}.no_trips ;;
    hidden: yes
  }

  dimension: no_trucks {
    type: number
    sql: ${TABLE}.no_trucks ;;
    hidden: yes
  }

  dimension: num_loading_points {
    type: number
    sql: ${TABLE}.num_loading_points ;;
    hidden: yes
  }

  dimension: num_unloading_points {
    type: number
    sql: ${TABLE}.num_unloading_points ;;
    hidden: yes
  }

  dimension: ops_user_id {
    type: number
    sql: ${TABLE}.ops_user_id ;;
  }

  dimension: optimized_loading {
    type: yesno
    sql: ${TABLE}.optimized_loading ;;
    hidden: yes
  }

  dimension: order_invoice_status {
    type: string
    sql: ${TABLE}.order_invoice_status ;;
  }

  dimension: order_value {
    type: number
    sql: ${TABLE}.order_value ;;
  }

  dimension: owner_id {
    type: number
    sql: ${TABLE}.owner_id ;;
  }

  dimension: payment_status_customer {
    type: string
    sql: ${TABLE}.payment_status_customer ;;
    hidden: yes
  }

  dimension: payment_status_truck {
    type: string
    sql: ${TABLE}.payment_status_truck ;;
    hidden: yes
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
    hidden: yes
  }

  dimension: profitability_index {
    type: number
    sql: ${TABLE}.profitability_index ;;
  }

  dimension: rate_type {
    type: number
    sql: ${TABLE}.rate_type ;;
  }

  dimension: receivables {
    type: number
    sql: ${TABLE}.receivables ;;
  }

  dimension_group: reporting {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.reporting_time ;;
    hidden: yes
  }

  dimension: routes_covered {
    type: number
    sql: ${TABLE}.routes_covered ;;
    hidden: yes
  }

  dimension: shipment_type {
    type: number
    sql: ${TABLE}.shipment_type ;;
    hidden: yes
  }

  dimension_group: start {
    type: time
    timeframes: [time, date, week, month, raw, hour, hour_of_day]
    sql: ${TABLE}.start_date ;;
  }

  dimension: start_location_id {
    type: number
    sql: ${TABLE}.start_location_id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension_group: status_transition_expiry {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.status_transition_expiry_time ;;
    hidden: yes
  }

  dimension_group: status_updated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.status_updated_time ;;
    hidden: yes
  }

  dimension: stock_quantity {
    type: number
    sql: ${TABLE}.stock_quantity ;;
    hidden: yes
  }

  dimension: supply_partner_id {
    type: number
    sql: ${TABLE}.supply_partner_id ;;
  }

  dimension: to_city_id {
    type: number
    sql: ${TABLE}.to_city_id ;;
  }

  dimension: to_pay_model {
    type: yesno
    sql: ${TABLE}.to_pay_model ;;
    hidden: yes
  }

  dimension: tonnage {
    type: number
    sql: ${TABLE}.tonnage ;;
  }

  dimension: settlment_document_status {
    type: number
    sql: ${TABLE}.settlement_document_status ;;
  }

  dimension: truck_type_id {
    type: number
    sql: ${TABLE}.truck_type_id ;;
  }

  dimension: unblock_reason {
    type: number
    sql: ${TABLE}.unblock_reason ;;
  }

  dimension: use_to_address_for_invoice {
    type: yesno
    sql: ${TABLE}.use_to_address_for_invoice ;;
    hidden: yes
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: from_sublocation_id {
    type: number
    sql: ${TABLE}.from_sublocation_id ;;
    hidden: yes
  }

  dimension: to_sublocation_id {
    type: number
    sql: ${TABLE}.to_sublocation_id ;;
    hidden: yes
  }

  measure: count {
    type: count_distinct
    sql: ${TABLE}.id ;;

    filters: {
      field: base_order.status
      value: "-Cancelled , - Cancelled By Customer"
    }

    drill_fields: [detail*]
  }

  measure: placement {
    type: count

    filters: {
      field: base_order.status
      value: "Truck Arrival Source, LR Generated, Advance DocVerification, Advance Docs Rejected, Advance Docs Approval Requested, Payment Pending, Advance Payment Rejected, Payment Done, Order Finalized, Started Trip, Truck Departure Source, Truck In-Transit, Truck Arrival Destination, Truck Unloading, Truck Departure Destination, Settlement DocVerification, Settlement Docs Rejected, Settlement Docs Approval Requested, Settlement Pending, Settlement Payment Rejected, Settlement Done, Docs Pending, Docs Received, Order Completed"
    }

    drill_fields: [detail*]
  }

  measure: placement_index {
    type: number
    sql: 1.0* ${placement}/ NULLIF(${count}, 0) ;;
    drill_fields: [detail*]
    value_format_name: percent_1
  }

  measure: Total_No_of_SP {
    type: count_distinct
    sql: ${supply_partner_id} ;;
    drill_fields: [supply_partner_id, auth_user.full_name, placement]

    filters: {
      field: base_order.end_date
      value: "this month"
    }
  }

  measure: Total_No_of_SP_2 {
    type: count_distinct
    sql: ${supply_partner_id} ;;
    drill_fields: [supply_partner_id, auth_user.full_name, placement]

    filters: {
      field: base_order.end_date
      value: "1 month ago"
    }
  }

  measure: Total_No_of_SP_1 {
    type: count_distinct
    sql: ${supply_partner_id} ;;
    drill_fields: [supply_partner_id, auth_user.full_name, placement]

    filters: {
      field: base_order.end_date
      value: "90 days"
    }
  }

  measure: Date {
    type: date
    sql: ${TABLE}.end_date ;;
  }

  measure: POD_Points_Index {
    type: sum_distinct
    sql: CASE WHEN TIMESTAMPDIFF(day,${TDS.dt_updated_raw},${POD_Sub.dt_updated_raw}) < (2*(${distance}/350000) + 10) THEN 1 ELSE 0 END ;;
    drill_fields: [id, status, end_date, Actual_POD_Time, Estimated_POD_Time]
  }

  measure: Responsiveness_Index {
    type: count_distinct
    sql: (CASE WHEN TIMESTAMPDIFF(minute,${TAS.dt_updated_raw},${end_raw}) > 0 THEN ${id} WHEN DATE(${start_raw}) = DATE(${end_raw}) and Date(${TAS.dt_updated_raw}) = DATE(${end_raw}) and HOUR(${TAS.dt_updated_raw}) < 15 THEN ${id} ELSE 0 END) ;;
    drill_fields: [id, Responsiveness_Index]
  }

  measure: Responsiveness_Level {
    type: number
    sql: CASE WHEN {% condition name_SP %} ${sp_name} {% endcondition %} THEN ${Responsiveness_Index} ELSE 0 END ;;
    drill_fields: [id, Responsiveness_Index]
  }

  measure: Avg_Order_Rate {
    type: average
    sql: NULLIF(${order_value},0) ;;
    value_format_name: decimal_0
    drill_fields: [detail*]

    filters: {
      field: base_order.end_date
      value: "30 days"
    }
  }

  measure: Freight_value {
    type: number
    sql: ${base_order.order_value} ;;
  }

  dimension: Lane_name {
    type: string
    sql: CONCAT(From_City.city,'',To_city.city) ;;
  }

  measure: Transit_time {
    type: number
    sql: TIMESTAMPDIFF(hour,${TAS.dt_updated_raw},${TAD.dt_updated_raw}) ;;
    value_format_name: decimal_1
  }

  measure: Avg_Order_Rate_Yesterday {
    type: average
    sql: IF (${base_orderfinancedetails.freight_amount} > 0, ${base_orderfinancedetails.freight_amount} ,null) ;;
    value_format_name: decimal_0
    drill_fields: [detail*]

    filters: {
      field: base_order.end_date
      value: "1 day ago"
    }
  }

  measure: Target_Adhered {
    type: yesno
    sql: ${dlp_laneratetargets.Target_Rate} > ${Avg_Order_Rate_mon} ;;
  }

  measure: Avg_Order_Rate_Today {
    type: average
    sql: IF (${base_orderfinancedetails.freight_amount} > 0, ${base_orderfinancedetails.freight_amount} ,null) ;;
    value_format_name: decimal_0
    drill_fields: [detail*]

    filters: {
      field: base_order.end_date
      value: "0 day ago"
    }
  }

  measure: Avg_Order_Rate_2 {
    type: average
    sql: IF (${base_orderfinancedetails.freight_amount} > 0, ${base_orderfinancedetails.freight_amount} ,null) ;;
    value_format_name: decimal_0
    drill_fields: [detail*]

    filters: {
      field: base_order.end_date
      value: "2 day ago"
    }
  }

  measure: Avg_Order_Rate_3 {
    type: average
    sql: IF (${base_orderfinancedetails.freight_amount} > 0, ${base_orderfinancedetails.freight_amount} ,null) ;;
    value_format_name: decimal_0
    drill_fields: [detail*]

    filters: {
      field: base_order.end_date
      value: "3 day ago"
    }
  }

  measure: Avg_Order_Rate_4 {
    type: average
    sql: IF (${base_orderfinancedetails.freight_amount} > 0, ${base_orderfinancedetails.freight_amount} ,null) ;;
    value_format_name: decimal_0
    drill_fields: [detail*]

    filters: {
      field: base_order.end_date
      value: "4 day ago"
    }
  }

  measure: Avg_Order_Rate_5 {
    type: average
    sql: IF (${base_orderfinancedetails.freight_amount} > 0, ${base_orderfinancedetails.freight_amount} ,null) ;;
    value_format_name: decimal_0
    drill_fields: [detail*]

    filters: {
      field: base_order.end_date
      value: "5 day ago"
    }
  }

  measure: Avg_Order_Rate_6 {
    type: average
    sql: IF (${base_orderfinancedetails.freight_amount} > 0, ${base_orderfinancedetails.freight_amount} ,null) ;;
    value_format_name: decimal_0
    drill_fields: [detail*]

    filters: {
      field: base_order.end_date
      value: "6 day ago"
    }
  }

  measure: Avg_Order_Rate_7 {
    type: average
    sql: IF (${base_orderfinancedetails.freight_amount} > 0, ${base_orderfinancedetails.freight_amount} ,null) ;;
    value_format_name: decimal_0
    drill_fields: [detail*]

    filters: {
      field: base_order.end_date
      value: "7 day ago"
    }
  }

  measure: Avg_Order_Rate_15 {
    type: average
    sql: IF (${base_orderfinancedetails.freight_amount} > 0, ${base_orderfinancedetails.freight_amount} ,null) ;;
    value_format_name: decimal_0
    drill_fields: [detail*]

    filters: {
      field: base_order.and_filter1
      value: "Yes"
    }
  }

  measure: Avg_Order_Rate_mon {
    type: average
    sql: IF (${base_orderfinancedetails.freight_amount} > 0, ${base_orderfinancedetails.freight_amount} ,null) ;;
    value_format_name: decimal_0
    drill_fields: [detail*]

    filters: {
      field: base_order.and_filter
      value: "Yes"
    }
  }

  dimension: and_filter {
    type: yesno
    sql: ${base_order.end_date} > (DATE(NOW()) - INTERVAL (EXTRACT( DAY FROM NOW())) DAY) and ${base_order.end_date} < DATE(NOW()) ;;
  }

  dimension: and_filter1 {
    type: yesno
    sql: ${base_order.end_date} > (DATE(NOW()) - INTERVAL (EXTRACT( DAY FROM NOW())) DAY) and ${base_order.end_date} < (DATE(NOW()) - INTERVAL 7 DAY) ;;
  }

  measure: Min_Order_Rate_month {
    type: min
    sql: IF (${base_orderfinancedetails.freight_amount} > 0, ${base_orderfinancedetails.freight_amount} ,null) ;;
    value_format_name: decimal_0
    drill_fields: [detail*]

    filters: {
      field: base_order.end_date
      value: "this month"
    }
  }

  measure: Count_Orders_Yesterday {
    type: count

    filters: {
      field: base_order.end_date
      value: "1 day ago"
    }

    drill_fields: [detail*]
  }

  measure: Expected_Loss_Index {
    type: number
    sql: ${Count_Orders_Yesterday}*(${base_orderdynamicprice.Target_Rates} - ${Avg_Order_Rate_Yesterday}) ;;
    value_format_name: decimal_2
    drill_fields: [detail*]
  }

  measure: App_Placed_Count {
    type: count_distinct
    sql: ${id} ;;

    filters: {
      field: accepted_by
      value: "9"
    }

    drill_fields: [detail*]
  }

  measure: Incomplete_Orders {
    type: count_distinct
    sql: ${id} ;;

    filters: {
      field: status
      value: "Order Incomplete"
    }

    drill_fields: [detail*]
  }

  measure: Incomplete_Orders_Percentage {
    type: number
    sql: 100*${Incomplete_Orders}/${count} ;;
    value_format_name: decimal_1
    html: <a target="_self" href={{ base_order.Incomplete_Orders._link }}> {{ rendered_value }} </a>;;
  }

  measure: App_Placement_Percentage {
    type: number
    sql: 100*${App_Placed_Count}/${count} ;;
    value_format_name: decimal_2
    html: <a target="_self" href={{ base_order.App_Placed_Count._link }}> {{ rendered_value }} </a>;;
  }

  dimension: performance_index {
    type: number
    sql: ceil(TIMESTAMPDIFF(hour,${TDS.dt_updated_raw},${TAD.dt_updated_raw}) - ((${distance}/350000)*24)) ;;
    drill_fields: [id, performance_index]
  }

  dimension: transit_tier {
    type: tier
    tiers: [0, 24, 48, 72]
    style: interval
    sql: ${performance_index} ;;
  }

  measure: Ex_TT {
    type: average
    sql: ceil((${distance}/350000)*24) ;;
    value_format_name: decimal_1
    drill_fields: [id, Ex_TT]
  }

  measure: Actual_Transit_Time {
    type: number
    sql: TIMESTAMPDIFF(hour,${TDS.dt_updated_raw},${base_orderinvoicerelatedinfo.date_of_arrival_raw}) ;;
  }

  measure: Avg_Freight_Value {
    type: average
    sql: ${order_value} ;;
    value_format_name: decimal_1
  }

  measure: Std_Dev {
    type: number
    sql: STDDEV(${order_value}) ;;
    value_format_name: decimal_1
  }

  measure: Avg_POD_Time {
    type: number
    sql: CASE WHEN {% condition name_SP %} ${sp_name} {% endcondition %} THEN AVG(TIMESTAMPDIFF(day,${TDS.dt_updated_raw},${POD_Sub.dt_updated_raw})) ELSE 0 END ;;
    value_format_name: decimal_1
    drill_fields: [id, Actual_POD_Time]
  }

  measure: Actual_POD_Time {
    type: number
    sql: TIMESTAMPDIFF(day,${TDS.dt_updated_raw},${POD_Sub.dt_updated_raw}) ;;
  }

  measure: Estimated_POD_Time {
    type: number
    sql: ceil(2*(${distance}/350000) + 10) ;;
  }

  measure: Responsiveness {
    type: number
    sql: 100*${Responsiveness_Index}/${count} ;;
    html: <a target="_self" href={{ base_order.Responsiveness_Index._link }}> {{ rendered_value }} </a>;;
  }

  measure: Count_TAS {
    type: count_distinct
    sql: ${id} ;;

    filters: {
      field: base_order.status
      value: "Truck Arrival Source"
    }
  }

  filter: name_SP {
    type: string
    suggest_dimension: sp_name
  }

  measure: count_by_customer {
    type: sum
    sql: CASE WHEN {% condition name_SP %} ${sp_name} {% endcondition %} THEN 1 ELSE 0 END
      ;;

    filters: {
      field: base_order.status
      value: "-Cancelled , - Cancelled By Customer"
    }
  }

  measure: Avg_Order_value {
    type: average
    sql: ${order_value} ;;
    drill_fields: [detail*]
  }

  measure: Count_Lanes {
    type: count_distinct
    sql: ${To_city.city} ;;
  }

  measure: Count_Lane_Dispersion {
    type: count_distinct
    sql: CASE WHEN {% condition name_SP %} ${sp_name} {% endcondition %} THEN ${To_city.city} ELSE 0 END ;;
    drill_fields: [From_City.city, To_city.city]
  }

  measure: utilized_days {
    type: sum
    sql: CASE WHEN {% condition name_SP %} ${sp_name} {% endcondition %} THEN ceil(${distance}/350000) ELSE 0 END ;;
    drill_fields: [id, distance]
  }

  measure: count_no_show {
    type: number
    sql: CASE WHEN {% condition name_SP %} ${sp_name} {% endcondition %} THEN ${base_statushistory.count_noshow} ELSE 0 END ;;
    drill_fields: [base_statushistory.order_id, base_statushistory.count_noshow]
  }

  measure: count_rejected {
    type: number
    sql: CASE WHEN {% condition name_SP %} ${sp_name} {% endcondition %} THEN ${base_statushistory.count_rejected} ELSE 0 END ;;
    drill_fields: [base_statushistory.order_id, base_statushistory.count_rejected]
  }

  measure: repeat_sp {
    type: count_distinct
    sql: CASE WHEN ${count} > 1 THEN ${supply_partner_id} ELSE NULL END ;;
  }

  measure: Avg_Transit_time {
    type: average
    sql: NULLIF(TIMESTAMPDIFF(hour,${TDS.dt_updated_raw},${TAD.dt_updated_raw}),0) ;;
  }

  measure: supply_demand_ratio {
    type: number
    sql: (${repeat_sp.count}*${supply_breath_calc.supply_breadth})/(${count}*${Avg_Transit_time}) ;;
    value_format_name: decimal_1
  }

  measure: avg_rate_per_km {
    type: average
    sql: ${order_value}/${distance} ;;
  }

  measure: avg_distance_covered_per_order {
    type: average
    sql: ${distance}/${count} ;;
  }

  measure: Order_Index_score {
    type: number
    sql: CASE WHEN ${count} <= 5 THEN ${count}*50 WHEN ${count} > 5 THEN 250 + (${count}-5)*10 ELSE 0 END ;;
  }

  dimension: Flag {
    type: yesno
    sql: DATE(${end_date} = DATE(${start_date}) ;;
  }

  measure: count_today {
    type: count

    filters: {
      field: base_order.end_date
      value: "today"
    }
  }

  measure: count_yesterday {
    type: count

    filters: {
      field: base_order.end_date
      value: "yesterday"
    }
  }

  measure: count_2_days_before {
    type: count

    filters: {
      field: base_order.end_date
      value: "2 days ago"
    }
  }



  measure: Right_truck_count {
    type: sum
    sql: CASE WHEN ${base_truck.truck_type_id} = ${truck_type_id} THEN 1 ELSE 0 END ;;
    drill_fields: [detail*]
  }

  set: detail {
    fields: [id, user_id, status, start_date, end_date, From_City.city, To_city.city, base_orderfinancedetails.freight_amount, base_orderdynamicprice.surge_charge, performance_index, Ex_TT]
  }

  dimension: Penalty_flag {
    case: {
      when: {
        sql:  2*ROUND(${distance}/350000,0)+10 <= TIMESTAMPDIFF(day,${end_date},NOW()) ;;
        label: "1"
      }
    else: "0"
    }




  }


  measure: Orders_invoiced {
    type: count_distinct
    sql: ${TABLE}.id ;;
    drill_fields: [id,order_invoice_status]

  filters: {
    field: base_order.order_invoice_status
    value: "Invoice Generated,Invoice Rejected , Invoice Sent , Invoice Verified , Invoice Verification Pending , Invoice Generated "
  }
  }

  measure: POD_Received_Count {
    type: count_distinct
    sql: ${TABLE}.id  ;;
    drill_fields: [id,order_invoice_status,base_orderdocument.document_type , base_orderdocument.document_status]

    filters: {
      field: base_orderdocument.document_type
      value: "3"}

    filters: {
      field: base_orderdocument.document_status
      value: "3"
    }

    filters: {
      field: order_invoice_status
      value: "Invoice Pending , Invoice Ready"
     }

  }

}
