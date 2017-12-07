view: elr_tracking {
  derived_table: {
    sql: select
      bo.id as 'GB Order Id',
      bt.registration_number as 'Truck Num',
      oa.dt_added as 'Accepted Time',
      bo.status,
      eb.supply_partner_id as 'SP Id',
      bup.name as 'SP Name', bup.company_name as 'SP Company Name',
      au.username as 'SP Num',
      eor.customer_id as 'Customer Id',
      bupc.name as 'Cust Name', bupc.company_name as 'Cust Company Name',
      auc.username as 'Cust Num',
      blf.city as 'From City',
      tlf.city as 'To City', tlf.state as 'To State',
      lr.lr_date as 'LR Time',
      auby.username as 'LR Created By'
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
      left join auth_user auby on lr.created_by_id = auby.id
      where date(oa.dt_added) between (current_date()-interval 15 day) and current_date()
      and blf.city in ('Anjar','Bhuj','Mundra','Jamnagar','Jodiya')
      and bo.client_order_id is not null
       ;;
  }

  dimension: gb_order_id {
    type: number
    label: "GB Order Id"
    sql: ${TABLE}.`GB Order Id` ;;
  }

  dimension: truck_num {
    type: string
    label: "Truck Num"
    sql: ${TABLE}.`Truck Num` ;;
  }

  dimension_group: accepted_time {
    type: time
    label: "Accepted Time"
    sql: ${TABLE}.`Accepted Time` ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: sp_id {
    type: number
    label: "SP Id"
    sql: ${TABLE}.`SP Id` ;;
  }

  dimension: sp_name {
    type: string
    label: "SP Name"
    sql: ${TABLE}.`SP Name` ;;
  }

  dimension: sp_company_name {
    type: string
    label: "SP Company Name"
    sql: ${TABLE}.`SP Company Name` ;;
  }

  dimension: sp_num {
    type: number
    label: "SP Num"
    sql: ${TABLE}.`SP Num` ;;
  }

  dimension: customer_id {
    type: number
    label: "Customer Id"
    sql: ${TABLE}.`Customer Id` ;;
  }

  dimension: cust_name {
    type: string
    label: "Cust Name"
    sql: ${TABLE}.`Cust Name` ;;
  }

  dimension: cust_company_name {
    type: string
    label: "Cust Company Name"
    sql: ${TABLE}.`Cust Company Name` ;;
  }

  dimension: cust_num {
    type: number
    label: "Cust Num"
    sql: ${TABLE}.`Cust Num` ;;
  }

  dimension: from_city {
    type: string
    label: "From City"
    sql: ${TABLE}.`From City` ;;
  }

  dimension: to_city {
    type: string
    label: "To City"
    sql: ${TABLE}.`To City` ;;
  }

  dimension: to_state {
    type: string
    label: "To State"
    sql: ${TABLE}.`To State` ;;
  }

  dimension_group: lr_time {
    type: time
    label: "LR Time"
    sql: ${TABLE}.`LR Time` ;;
  }

  dimension: lr_created_by {
    type: string
    label: "LR Created By"
    sql: ${TABLE}.`LR Created By` ;;
  }

}
