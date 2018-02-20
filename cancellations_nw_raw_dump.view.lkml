view: cancellations_nw_raw_dump {
  derived_table: {
    sql: select
      bo.id as 'Order Id',
      bo.status,
      (case when oa.dt_added is null then date(ob.dt_added) else date(oa.dt_added) end) as 'Placed Date',
      bst.sector_name,
      cup.name as 'Customer Name',
      bupc.mobile1 as 'Customer Number',
      aus.first_name as 'SP Name',
      aus.username as 'SP Number',
      blf.city as 'From City', blf.state as 'From State',
      tlf.city as 'To City', tlf.state as 'To State',
      sha.registration_number as 'Truck_Number',
      fo.profile_type,
      str.reason,
      bsh.transition_comment as 'Comment'
      from base_order bo
      left join base_truck bt on bt.id = bo.assigned_truck_id
      left join base_location blf on blf.id = bo.from_city_id
      left join base_location tlf on tlf.id = bo.to_city_id
      left join base_customeruserprofile cup on cup.user_id = bo.user_id
      left join base_status oa on oa.order_id = bo.id and oa.status = 'Order Accepted'
      left join base_status ob on ob.order_id = bo.id and ob.status = 'Order Blocked'
      left join base_sectortype bst on bst.id = bo.customer_sector_id
      left join base_userprofile bupc on cup.user_id = bupc.user_id
      left join base_statushistory sha on sha.order_id = bo.id and sha.status = 'Order Accepted'
      left join base_statushistory bsh on bsh.order_id = bo.id and bsh.status = 'Order Processing' and bsh.transition_reason_enum is not null
      left join base_statustransitionreasons str on str.id = bsh.transition_reason_enum
      left join auth_user aus on aus.username = sha.mobile_number
      left join
      (
      select au.username,
      (case when bup.profile_type in ('fleet_owner','transport_contractor') then 'FO' else 'Non-FO' end) as 'profile_type'
      from newbb.auth_user au left join newbb.base_userprofile bup on bup.user_id = au.id
      ) fo on fo.username = aus.username
      where (date(oa.dt_added) >= (current_date()-interval 90 day) or (oa.dt_added is null and date(ob.dt_added) >= (current_date()-interval 90 day)))
      and bo.status in ('Cancelled By Customer','Cancelled','Order Processing','KAM Review','Ops Review','Order Incomplete')
      and (bst.id in (6,7,9,11,16,17,18,19) or blf.city in ('Ahmedabad','Anand','Himmatnagar','Palanpur','Sanand','Gandhinagar','Godhra','Halol','Himmatnagar','Kadi','Kalol','Matar','Mehsana','Vadgam','Vijapur','Anjar','Bhuj','Jamnagar','Jetpur','Jodiya','Lakhatar','Mundra','Rajkot','Ankleshwar','Dahej','Hazira','Bharuch','Jhagadia','Karjan','Surat','Vyara','Gurgaon','Hassangarh','Faridabad','Hisar','Panipat','Bahadurgarh','Gannaur','Karnal','Rohtak','Safidon','Sonipat','Alipur','Delhi','New Delhi','Jaipur','Newai','Chomu','Kishangarh','Niwai','Agucha','Chanderia','Dariba','Beawar','Bhilwara','Bikaner','Chittorgarh','Gulabpura','Kherwara','Kolayat','Rajsamand','Relmangra','Udaipur','Dasna','Ghaziabad'))
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: order_id {
    type: string
    label: "Order Id"
    sql: ${TABLE}.`Order Id` ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: placed_date {
    type: date
    label: "Placed Date"
    sql: ${TABLE}.`Placed Date` ;;
  }

  dimension: sector_name {
    type: string
    sql: ${TABLE}.sector_name ;;
  }

  dimension: customer_name {
    type: string
    label: "Customer Name"
    sql: ${TABLE}.`Customer Name` ;;
  }

  dimension: customer_number {
    type: string
    label: "Customer Number"
    sql: ${TABLE}.`Customer Number` ;;
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

  dimension: truck_number {
    type: string
    sql: ${TABLE}.Truck_Number ;;
  }

  dimension: profile_type {
    type: string
    sql: ${TABLE}.profile_type ;;
  }

  dimension: reason {
    type: string
    sql: ${TABLE}.reason ;;
  }

  dimension: comment {
    type: string
    sql: ${TABLE}.Comment ;;
  }

  set: detail {
    fields: [
      order_id,
      status,
      placed_date,
      sector_name,
      customer_name,
      customer_number,
      sp_name,
      sp_number,
      from_city,
      from_state,
      to_city,
      to_state,
      truck_number,
      profile_type,
      reason,
      comment
    ]
  }
}
