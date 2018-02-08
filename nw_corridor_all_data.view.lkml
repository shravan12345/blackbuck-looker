view: nw_corridor_all_data {
  derived_table: {
    sql: select
      bo.id as 'GB Order Id',
      (case when oa.dt_added is null then date(ob.dt_added) else date(oa.dt_added) end) as 'Accepted Date',
      bo.status,
      bt.registration_number as 'Truck Num',
      fo.profile_type,
      aus.first_name as 'SP Name',
      aus.username as 'SP Number',
      blf.city as 'From City', blf.state as 'From State',
      tlf.city as 'To City', tlf.state as 'To State',
      cup.name as 'Customer Name',
      bst.sector_name as 'Sector',
      (case when adr.adhoc_rate is null then bop.total_revenue/bo.tonnage when adr.adhoc_rate > 4000 then adr.adhoc_rate/bo.tonnage else adr.adhoc_rate end) as 'Customer Adhoc Rate',
      (case when ofd.per_ton_rate is null then ofd.freight_amount/bo.tonnage else ofd.per_ton_rate end) as 'Supply Per Ton Rate',
      bo.tonnage,
      pd.dt_Added as 'Payment Date'
      from base_order bo
      left join auth_user aus on aus.id = bo.supply_partner_id
      left join base_truck bt on bt.id = bo.assigned_truck_id
      left join base_location blf on blf.id = bo.from_city_id
      left join base_location tlf on tlf.id = bo.to_city_id
      left join base_status oa on oa.order_id = bo.id and oa.status = 'Order Accepted'
      left join base_status ob on ob.order_id = bo.id and ob.status = 'Order Blocked'
      left join base_status pd on pd.order_id = bo.id and pd.status = 'Payment Done'
      left join base_orderfinancedetails ofd on ofd.order_id = bo.id
      left join base_adhocorderrates adr on adr.id = bo.adhoc_rate_reference_id
      left join base_orderprofitability bop on bop.order_id = bo.id
      left join base_customeruserprofile cup on cup.user_id = bo.user_id
      left join base_sectortype bst on bst.id = bo.customer_sector_id
      left join
      (
      select au.username,
      (case when bup.profile_type in ('fleet_owner','transport_contractor') then 'FO' else 'Non-FO' end) as 'profile_type'
      from newbb.auth_user au left join newbb.base_userprofile bup on bup.user_id = au.id
      ) fo on fo.username = aus.username
      where (date(oa.dt_added) >= (current_date()-interval 30 day) or (oa.dt_added is null and date(ob.dt_added) >= (current_date()-interval 30 day)))
      and (blf.city in ('Anjar','Mundra','Jodiya','Jamnagar','Jetpur','Bhachau','Bhuj') or bst.id in (6,7,9,11,16,17))
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
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

  dimension: truck_num {
    type: string
    label: "Truck Num"
    sql: ${TABLE}.`Truck Num` ;;
  }

  dimension: profile_type {
    type: string
    sql: ${TABLE}.profile_type ;;
  }

  dimension: sp_name {
    type: string
    label: "SP Name"
    sql: ${TABLE}.`SP Name` ;;
  }

  dimension: sp_number {
    type: string
    label: "SP Number"
    sql: ${TABLE}.`SP Number` ;;
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

  dimension: customer_name {
    type: string
    label: "Customer Name"
    sql: ${TABLE}.`Customer Name` ;;
  }

  dimension: sector {
    type: string
    sql: ${TABLE}.Sector ;;
  }

  dimension: customer_adhoc_rate {
    type: string
    label: "Customer Adhoc Rate"
    sql: ${TABLE}.`Customer Adhoc Rate` ;;
  }

  dimension: supply_per_ton_rate {
    type: string
    label: "Supply Per Ton Rate"
    sql: ${TABLE}.`Supply Per Ton Rate` ;;
  }

  dimension: tonnage {
    type: string
    sql: ${TABLE}.tonnage ;;
  }

  dimension: payment_date {
    type: string
    label: "Payment Date"
    sql: ${TABLE}.`Payment Date` ;;
  }

  set: detail {
    fields: [
      gb_order_id,
      accepted_date,
      status,
      truck_num,
      profile_type,
      sp_name,
      sp_number,
      from_city,
      from_state,
      to_city,
      to_state,
      customer_name,
      sector,
      customer_adhoc_rate,
      supply_per_ton_rate,
      tonnage,
      payment_date
    ]
  }
}
