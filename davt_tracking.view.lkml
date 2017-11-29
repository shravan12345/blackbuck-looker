view: davt_tracking {
  derived_table: {
    sql: select distinct
      bo.id as 'GB_Order_Id',
      blf.city as 'From_City',
      tlf.city as 'To_City',
      bupc.name as 'Cust_Name',
      adv.dt_added as 'Advance DocVerification Timestamp',
      pp.dt_added as 'Payment Pending Timestamp'
      from base_order bo
      join newbb.enquiry_order eo on eo.id = bo.client_handshake_order_id
      left join base_status adv on adv.order_id = bo.id and adv.status = 'Advance DocVerification'
      left join base_status pp on pp.order_id = bo.id and pp.status = 'Payment Pending'
      left join base_location blf on blf.id = bo.from_city_id
      left join base_location tlf on tlf.id = bo.to_city_id
      left join newbb.enquiry_orderrequest eor on eo.order_request_id = eor.id
      left join newbb.base_userprofile bupc on eor.customer_id = bupc.user_id
      where date(adv.dt_added) between (current_date()-interval 1 day) and current_date()
       ;;
  }


  dimension: gb_order_id {
    type: number
    sql: ${TABLE}.GB_Order_Id ;;
  }

  dimension: from_city {
    type: string
    sql: ${TABLE}.From_City ;;
  }

  dimension: to_city {
    type: string
    sql: ${TABLE}.To_City ;;
  }

  dimension: cust_name {
    type: string
    sql: ${TABLE}.Cust_Name ;;
  }

  dimension_group: advance_doc_verification_timestamp {
    type: time
    timeframes: [time, date, week, month, hour, hour_of_day, raw, day_of_week]
    label: "Advance DocVerification Timestamp"
    sql: ${TABLE}.`Advance DocVerification Timestamp` ;;
  }

  dimension_group: payment_pending_timestamp {
    type: time
    timeframes: [time, date, week, month, hour, hour_of_day, raw, day_of_week]
    label: "Payment Pending Timestamp"
    sql: ${TABLE}.`Payment Pending Timestamp` ;;
  }

}
