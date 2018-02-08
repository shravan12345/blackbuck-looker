view: nw_live_placement {
  derived_table: {
    sql: select
      bo.id as 'GB Order Id',
      fo.profile_type,
      (case when oa.dt_added is null then date(ob.dt_added) else date(oa.dt_added) end) as 'Accepted Date',
      bo.status,
      aus.first_name as 'SP Name',
      aus.username as 'SP Number',
      blf.city as 'From City', blf.state as 'From State',
      tlf.city as 'To City', tlf.state as 'To State',
      (case when adr.adhoc_rate is null then bop.total_revenue/bo.tonnage when adr.adhoc_rate > 4000 then adr.adhoc_rate/bo.tonnage else adr.adhoc_rate end) as 'Customer Adhoc Rate',
      (case when ofd.per_ton_rate is null then ofd.freight_amount/bo.tonnage else ofd.per_ton_rate end) as 'Supply Per Ton Rate',
      bo.tonnage,
      bt.registration_number as 'Truck_Number',
      ofd.commission,
      bst.sector_name,
      bbt.business_name,
      cup.name as 'Customer_Name'
      from base_order bo
      left join base_truck bt on bt.id = bo.assigned_truck_id
      left join auth_user aus on aus.id = bo.supply_partner_id
      left join base_location blf on blf.id = bo.from_city_id
      left join base_location tlf on tlf.id = bo.to_city_id
      left join base_status oa on oa.order_id = bo.id and oa.status = 'Order Accepted'
      left join base_status ob on ob.order_id = bo.id and ob.status = 'Order Blocked'
      left join base_orderfinancedetails ofd on ofd.order_id = bo.id
      left join base_adhocorderrates adr on adr.id = bo.adhoc_rate_reference_id
      left join base_orderprofitability bop on bop.order_id = bo.id
      left join base_customeruserprofile cup on cup.user_id = bo.user_id
      left join base_sectortype bst on bst.id = cup.sector_type_id
      left join base_businesstype bbt on bbt.id = bst.business_type_id
      left join
      (
      select au.username,
      (case when bup.profile_type in ('fleet_owner','transport_contractor') then 'FO' else 'Non-FO' end) as 'profile_type'
      from newbb.auth_user au left join newbb.base_userprofile bup on bup.user_id = au.id
      ) fo on fo.username = aus.username
      where (date(oa.dt_added) = current_date() or (oa.dt_added is null and date(ob.dt_added) = current_date()))
      and bo.status not in ('Cancelled By Customer','Cancelled','Order Processing','KAM Review','Ops Review','Order Incomplete')
      and (bst.id in (6,7,9,11,16,17,18,19) or blf.city in ('Ahmedabad','Anand','Himmatnagar','Palanpur','Sanand','Gandhinagar','Godhra','Halol','Himmatnagar','Kadi','Kalol','Matar','Mehsana','Vadgam','Vijapur','Anjar','Bhuj','Jamnagar','Jetpur','Jodiya','Lakhatar','Mundra','Rajkot','Ankleshwar','Dahej','Hazira','Bharuch','Jhagadia','Karjan','Surat','Vyara','Gurgaon','Hassangarh','Faridabad','Hisar','Panipat','Bahadurgarh','Gannaur','Karnal','Rohtak','Safidon','Sonipat','Alipur','Delhi','New Delhi','Jaipur','Newai','Chomu','Kishangarh','Niwai','Agucha','Chanderia','Dariba','Beawar','Bhilwara','Bikaner','Chittorgarh','Gulabpura','Kherwara','Kolayat','Rajsamand','Relmangra','Udaipur','Dasna','Ghaziabad'))
       ;;
  }

  dimension: profile_type {
    type: string
    sql: ${TABLE}.profile_type ;;
  }

  dimension: commission {
    type: number
    sql: ${TABLE}.commission ;;
  }

  dimension: Customer_Name {
    type: string
    sql: ${TABLE}.Customer_Name ;;
  }

  dimension: Truck_Number {
    type: string
    sql: ${TABLE}.Truck_Number ;;
  }

  dimension: business_name {
    type: string
    sql: ${TABLE}.business_name ;;
  }

  dimension: sector_name {
    type: string
    sql: ${TABLE}.sector_name ;;
  }


  dimension: gb_order_id {
    type: number
    label: "GB Order Id"
    sql: ${TABLE}.`GB Order Id` ;;
  }

  dimension: customer_adhoc_rate {
    type: number
    label: "Customer Adhoc Rate"
    sql: ${TABLE}.`Customer Adhoc Rate` ;;
  }

  dimension: supply_per_ton_rate {
    type: number
    label: "Supply Per Ton Rate"
    sql: ${TABLE}.`Supply Per Ton Rate` ;;
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

  dimension: tonnage {
    type: number
    sql: ${TABLE}.tonnage ;;
  }

  dimension: sp_name {
    type: string
    label: "SP Name"
    sql: ${TABLE}.`SP Name` ;;
  }

  dimension: sp_number {
    type: number
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

}
