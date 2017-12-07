view: placement_tracker {
  derived_table: {
    sql: select
      (case when bup.profile_type in ('fleet_owner','transport_contractor') then 'FO' else 'Non-FO' end) as 'Profile Type',
      eor.business_type,
      bo.id as 'GB Order Id',
      bt.registration_number as 'Truck Num',
      date(oa.dt_added) as 'Accepted Date',
      date(bo.end_date) as 'Shipment Date',
      bo.status,
      eor.id as 'Request Id',
      eb.supply_partner_id as 'SP Id',
      bup.name as 'SP Name', bup.company_name as 'SP Company Name',
      au.username as 'SP Num',
      eor.customer_id as 'Customer Id',
      bupc.name as 'Cust Name', bupc.company_name as 'Cust Company Name',
      auc.username as 'Cust Num',
      blf.city as 'From City', blf.state as 'From State',
      tlf.city as 'To City', tlf.state as 'To State',
      (case when eb.source = 'dashboard' then 'Dashboard' else 'App' end) as 'Bid Source',
      (case when eo.source = 'dashboard' then 'Dashboard' else 'App' end) as 'Handshake Source',
      eor.product
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
      where date(oa.dt_added) = current_date()
      and blf.city in ('Anjar','Bhuj','Mundra','Jamnagar','Jodiya')
      and bo.client_order_id is not null
      and bo.status not in ('Cancelled By Customer','Cancelled','Order Processing','KAM Review','Ops Review','Order Incomplete')
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: profile_type {
    type: string
    label: "Profile Type"
    sql: ${TABLE}.`Profile Type` ;;
  }

  dimension: business_type {
    type: string
    sql: ${TABLE}.business_type ;;
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

  dimension: accepted_date {
    type: date
    label: "Accepted Date"
    sql: ${TABLE}.`Accepted Date` ;;
  }

  dimension: shipment_date {
    type: date
    label: "Shipment Date"
    sql: ${TABLE}.`Shipment Date` ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: request_id {
    type: number
    label: "Request Id"
    sql: ${TABLE}.`Request Id` ;;
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
    type: string
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
    type: string
    label: "Cust Num"
    sql: ${TABLE}.`Cust Num` ;;
  }

  dimension: from_city {
    type: string
    label: "From City"
    sql: ${TABLE}.`From City` ;;
  }

  dimension: from_state {
    type: string
    label: "From State"
    sql: ${TABLE}.`From State` ;;
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


  dimension: bid_source {
    type: string
    label: "Bid Source"
    sql: ${TABLE}.`Bid Source` ;;
  }

  dimension: handshake_source {
    type: string
    label: "Handshake Source"
    sql: ${TABLE}.`Handshake Source` ;;
  }

  dimension: product {
    type: string
    sql: ${TABLE}.product ;;
  }


  set: detail {
    fields: [
      profile_type,
      business_type,
      gb_order_id,
      truck_num,
      accepted_date,
      shipment_date,
      status,
      request_id,
      sp_id,
      sp_name,
      sp_company_name,
      sp_num,
      customer_id,
      cust_name,
      cust_company_name,
      cust_num,
      from_city,
      from_state,
      to_city,
      to_state,
      bid_source,
      handshake_source,
      product
    ]
  }
}
