view: fo_contract_data {
  derived_table: {
    sql: select
      eb.supply_partner_id as 'SP Id',
      aus.first_name as 'SP Name',
      bt.registration_number as 'Truck Num',
      bo.id as 'GB Order Id',
      date(oa.dt_added) as 'Accepted Date',
      bo.status,
      blf.city as 'From City', blf.state as 'From State',
      tlf.city as 'To City', tlf.state as 'To State',
      eor.product,
      adv.dt_Added as 'DAVT_Time',
      eor.unit_price as 'Request Price',
      eb.unit_price as 'Handshake Price',
      bo.tonnage,
      ofd.commission,
      ofd.payment_type
      from base_order bo
      left join newbb.enquiry_order eo on eo.id = bo.client_handshake_order_id
      left join base_truck bt on bt.id = bo.assigned_truck_id
      left join base_location blf on blf.id = bo.from_city_id
      left join base_location tlf on tlf.id = bo.to_city_id
      left join base_status oa on oa.order_id = bo.id and oa.status = 'Order Accepted'
      left join base_status adv on adv.order_id = bo.id and adv.status = 'Advance DocVerification'
      left join newbb.enquiry_orderrequest eor on eo.order_request_id = eor.id
      left join newbb.enquiry_bid eb on eo.bid_id = eb.id
      left join newbb.base_userprofile bup on eb.supply_partner_id = bup.user_id
      left join newbb.auth_user au on au.id = bup.user_id
      left join base_orderfinancedetails ofd on ofd.order_id = bo.id
      left join auth_user aus on aus.id = bo.supply_partner_id
      where date(oa.dt_added) >= '2017-12-27'
      and bo.status not in ('Cancelled By Customer','Cancelled','Order Processing','KAM Review','Ops Review','Order Incomplete')
      and aus.username in (9950824867,9991101202)
      order by 5 desc,3
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: sp_id {
    type: string
    label: "SP Id"
    sql: ${TABLE}.`SP Id` ;;
  }

  dimension: sp_name {
    type: string
    label: "SP Name"
    sql: ${TABLE}.`SP Name` ;;
  }

  dimension: truck_num {
    type: string
    label: "Truck Num"
    sql: ${TABLE}.`Truck Num` ;;
  }

  dimension: gb_order_id {
    type: string
    label: "GB Order Id"
    sql: ${TABLE}.`GB Order Id` ;;
  }

  dimension: accepted_date {
    type: date
    label: "Accepted Date"
    sql: ${TABLE}.`Accepted Date` ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
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

  dimension: product {
    type: string
    sql: ${TABLE}.product ;;
  }

  dimension: davt_time {
    type: string
    sql: ${TABLE}.DAVT_Time ;;
  }

  dimension: handshake_price {
    type: string
    label: "Handshake Price"
    sql: ${TABLE}.`Handshake Price` ;;
  }

  dimension: request_price {
    type: string
    label: "Request Price"
    sql: ${TABLE}.`Request Price` ;;
  }

  dimension: tonnage {
    type: string
    sql: ${TABLE}.tonnage ;;
  }

  dimension: commission {
    type: string
    sql: ${TABLE}.commission ;;
  }

  dimension: payment_type {
    type: string
    sql: ${TABLE}.payment_type ;;
  }

  set: detail {
    fields: [
      sp_id,
      sp_name,
      truck_num,
      gb_order_id,
      accepted_date,
      status,
      from_city,
      from_state,
      to_city,
      to_state,
      product,
      davt_time,
      handshake_price,
      commission
    ]
  }
}
