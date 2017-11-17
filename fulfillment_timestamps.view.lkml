view: fulfillment_timestamps {
  derived_table: {
    sql: select distinct
      bo.id as 'GB_Order_Id',
      eor.business_type,
      blf.city as 'From_City',
      bupc.name as 'Cust_Name',
      oa.dt_added as 'Order Accepted Timestamp',
      tas.dt_added as 'TAS Timestamp',
      adv.dt_added as 'DAVT Timestamp',
      pp.dt_added as 'Payment Pending Timestamp',
      pd.dt_added as 'Payment Done Timestamp'
      from base_order bo
      join newbb.enquiry_order eo on eo.id = bo.client_handshake_order_id
      left join base_status oa on oa.order_id = bo.id and oa.status = 'Order Accepted'
      left join base_status tas on tas.order_id = bo.id and tas.status = 'Truck Arrival Source'
      left join base_status adv on adv.order_id = bo.id and adv.status = 'Advance DocVerification'
      left join base_status pp on pp.order_id = bo.id and pp.status = 'Payment Pending'
      left join base_status pd on pd.order_id = bo.id and pd.status = 'Payment Done'
      left join base_location blf on blf.id = bo.from_city_id
      left join newbb.enquiry_orderrequest eor on eo.order_request_id = eor.id
      left join newbb.base_userprofile bupc on eor.customer_id = bupc.user_id
      where date(pd.dt_added) between (current_date()-interval 31 day) and current_date()
      and blf.city in ('Anjar','Bhuj','Mundra','Jamnagar')
       ;;
  }


  dimension: gb_order_id {
    type: number
    sql: ${TABLE}.GB_Order_Id ;;
  }

  dimension: business_type {
    type: string
    sql: ${TABLE}.business_type ;;
  }

  dimension: from_city {
    type: string
    sql: ${TABLE}.From_City ;;
  }

  dimension: cust_name {
    type: string
    sql: ${TABLE}.Cust_Name ;;
  }

  dimension_group: order_accepted_timestamp {
    type: time
    timeframes: [time, date, week, month, hour, hour_of_day, raw, day_of_week]
    label: "Order Accepted Timestamp"
    sql: ${TABLE}.`Order Accepted Timestamp` ;;
  }

  dimension_group: tas_timestamp {
    type: time
    timeframes: [time, date, week, month, hour, hour_of_day, raw, day_of_week]
    label: "TAS Timestamp"
    sql: ${TABLE}.`TAS Timestamp` ;;
  }

  dimension_group: davt_timestamp {
    type: time
    timeframes: [time, date, week, month, hour, hour_of_day, raw, day_of_week]
    label: "DAVT Timestamp"
    sql: ${TABLE}.`DAVT Timestamp` ;;
  }

  dimension_group: payment_pending_timestamp {
    type: time
    timeframes: [time, date, week, month, hour, hour_of_day, raw, day_of_week]
    label: "Payment Pending Timestamp"
    sql: ${TABLE}.`Payment Pending Timestamp` ;;
  }

  dimension_group: payment_done_timestamp {
    type: time
    timeframes: [time, date, week, month, hour, hour_of_day, raw, day_of_week]
    label: "Payment Done Timestamp"
    sql: ${TABLE}.`Payment Done Timestamp` ;;
  }

}
