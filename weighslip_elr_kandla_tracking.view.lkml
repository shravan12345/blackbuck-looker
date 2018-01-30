view: weighslip_elr_kandla_tracking {
  derived_table: {
    sql: select
      bod.last_modified_date as 'Weight_Slip',
      bo.id as 'GB_Order_Id',
      bt.registration_number as 'Truck_Num',
      oa.dt_added as 'Accepted_Time',
      bo.status as 'Current_Status',
      eor.customer_id as 'Customer_Id',
      bupc.name as 'Cust_Name',
      auc.username as 'Cust_Num',
      blf.city as 'From_City',
      tlf.city as 'To_City', tlf.state as 'To_State',
      lr.created_date as 'e-LR_Time',
      adv.dt_Added as 'DAVT_Time',
      pd.dt_Added as 'Payment_Done_Time'
      from base_order bo
      join newbb.enquiry_order eo on eo.id = bo.client_handshake_order_id
      left join base_truck bt on bt.id = bo.assigned_truck_id
      left join base_location blf on blf.id = bo.from_city_id
      left join base_location tlf on tlf.id = bo.to_city_id
      left join base_status oa on oa.order_id = bo.id and oa.status = 'Order Accepted'
      left join newbb.enquiry_orderrequest eor on eo.order_request_id = eor.id
      left join newbb.enquiry_bid eb on eo.bid_id = eb.id
      left join newbb.base_userprofile bup on eb.supply_partner_id = bup.user_id
      left join newbb.auth_user au on au.id = bup.user_id
      left join newbb.base_userprofile bupc on eor.customer_id = bupc.user_id
      left join newbb.auth_user auc on auc.id = bupc.user_id
      left join base_lorryreceipt lr on lr.order_id = bo.id
      left join base_orderdocument bod on bod.order_id = bo.id and bod.document_type = 13
      left join base_status adv on adv.order_id = bo.id and adv.status = 'Advance DocVerification'
      left join base_status pd on pd.order_id = bo.id and pd.status = 'Payment Done'
      where date(oa.dt_added) >=  '2018-01-30'
      and blf.city in ('Anjar','Bhuj','Mundra')
      and bo.client_order_id is not null
      order by 1 desc
       ;;
  }


  dimension_group: weight_slip {
    type: time
    sql: ${TABLE}.Weight_Slip ;;
  }

  dimension: gb_order_id {
    type: number
    sql: ${TABLE}.GB_Order_Id ;;
  }

  dimension: truck_num {
    type: string
    sql: ${TABLE}.Truck_Num ;;
  }

  dimension_group: accepted_time {
    type: time
    sql: ${TABLE}.Accepted_Time ;;
  }

  dimension: current_status {
    type: string
    sql: ${TABLE}.Current_Status ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.Customer_Id ;;
  }

  dimension: cust_name {
    type: string
    sql: ${TABLE}.Cust_Name ;;
  }

  dimension: cust_num {
    type: number
    sql: ${TABLE}.Cust_Num ;;
  }

  dimension: from_city {
    type: string
    sql: ${TABLE}.From_City ;;
  }

  dimension: to_city {
    type: string
    sql: ${TABLE}.To_City ;;
  }

  dimension: to_state {
    type: string
    sql: ${TABLE}.To_State ;;
  }

  dimension_group: elr_time {
    type: time
    sql: ${TABLE}.`e-LR_Time` ;;
  }

  dimension_group: davt_time {
    type: time
    sql: ${TABLE}.DAVT_Time ;;
  }

  dimension_group: payment_done_time {
    type: time
    sql: ${TABLE}.Payment_Done_Time ;;
  }


}
