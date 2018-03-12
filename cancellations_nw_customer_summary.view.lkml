view: cancellations_nw_customer_summary {
  derived_table: {
    sql: select
      cup.name as 'Customer Name',
      bupc.mobile1 as 'Customer Number',
      count(distinct case when (date(oa.dt_added) >= (current_date()-interval 7 day) or (oa.dt_added is null and date(ob.dt_added) >= (current_date()-interval 7 day))) then bo.id end) as 'D7 Placed',
      count(distinct case when bo.status in ('Cancelled By Customer','Cancelled','Order Processing','KAM Review','Ops Review','Order Incomplete') and (date(oa.dt_added) >= (current_date()-interval 7 day) or (oa.dt_added is null and date(ob.dt_added) >= (current_date()-interval 7 day))) then bo.id end) as 'D7 Cancelled',
      count(distinct case when (date(oa.dt_added) >= (current_date()-interval 15 day) or (oa.dt_added is null and date(ob.dt_added) >= (current_date()-interval 15 day))) then bo.id end) as 'D15 Placed',
      count(distinct case when bo.status in ('Cancelled By Customer','Cancelled','Order Processing','KAM Review','Ops Review','Order Incomplete') and (date(oa.dt_added) >= (current_date()-interval 15 day) or (oa.dt_added is null and date(ob.dt_added) >= (current_date()-interval 15 day))) then bo.id end) as 'D15 Cancelled',
      count(distinct case when (date(oa.dt_added) >= (current_date()-interval 30 day) or (oa.dt_added is null and date(ob.dt_added) >= (current_date()-interval 30 day))) then bo.id end) as 'D30 Placed',
      count(distinct case when bo.status in ('Cancelled By Customer','Cancelled','Order Processing','KAM Review','Ops Review','Order Incomplete') and (date(oa.dt_added) >= (current_date()-interval 30 day) or (oa.dt_added is null and date(ob.dt_added) >= (current_date()-interval 30 day))) then bo.id end) as 'D30 Cancelled',
      count(distinct case when (date(oa.dt_added) >= (current_date()-interval 60 day) or (oa.dt_added is null and date(ob.dt_added) >= (current_date()-interval 60 day))) then bo.id end) as 'D60 Placed',
      count(distinct case when bo.status in ('Cancelled By Customer','Cancelled','Order Processing','KAM Review','Ops Review','Order Incomplete') and (date(oa.dt_added) >= (current_date()-interval 60 day) or (oa.dt_added is null and date(ob.dt_added) >= (current_date()-interval 60 day))) then bo.id end) as 'D60 Cancelled',
      count(distinct case when (date(oa.dt_added) >= (current_date()-interval 90 day) or (oa.dt_added is null and date(ob.dt_added) >= (current_date()-interval 90 day))) then bo.id end) as 'D90 Placed',
      count(distinct case when bo.status in ('Cancelled By Customer','Cancelled','Order Processing','KAM Review','Ops Review','Order Incomplete') and (date(oa.dt_added) >= (current_date()-interval 90 day) or (oa.dt_added is null and date(ob.dt_added) >= (current_date()-interval 90 day))) then bo.id end) as 'D90 Cancelled'
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
      and (bst.id in (6,7,9,11,16,17,18,19) or blf.city in ('Ahmedabad','Anand','Himmatnagar','Palanpur','Sanand','Gandhinagar','Godhra','Halol','Himmatnagar','Kadi','Kalol','Matar','Mehsana','Vadgam','Vijapur','Anjar','Bhuj','Jamnagar','Jetpur','Jodiya','Lakhatar','Mundra','Rajkot','Ankleshwar','Dahej','Hazira','Bharuch','Jhagadia','Karjan','Surat','Vyara','Gurgaon','Hassangarh','Faridabad','Hisar','Panipat','Bahadurgarh','Gannaur','Karnal','Rohtak','Safidon','Sonipat','Alipur','Delhi','New Delhi','Jaipur','Newai','Chomu','Kishangarh','Niwai','Agucha','Chanderia','Dariba','Beawar','Bhilwara','Bikaner','Chittorgarh','Gulabpura','Kherwara','Kolayat','Rajsamand','Relmangra','Udaipur','Dasna','Ghaziabad'))
      group by 1,2
      order by 3 desc
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
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

  dimension: d7_placed {
    type: number
    label: "D7 Placed"
    sql: ${TABLE}.`D7 Placed` ;;
  }

  dimension: d7_cancelled {
    type: number
    label: "D7 Cancelled"
    sql: ${TABLE}.`D7 Cancelled` ;;
  }

  dimension: d15_placed {
    type: number
    label: "D15 Placed"
    sql: ${TABLE}.`D15 Placed` ;;
  }

  dimension: d15_cancelled {
    type: number
    label: "D15 Cancelled"
    sql: ${TABLE}.`D15 Cancelled` ;;
  }

  dimension: d30_placed {
    type: number
    label: "D30 Placed"
    sql: ${TABLE}.`D30 Placed` ;;
  }

  dimension: d30_cancelled {
    type: number
    label: "D30 Cancelled"
    sql: ${TABLE}.`D30 Cancelled` ;;
  }

  dimension: d60_placed {
    type: number
    label: "D60 Placed"
    sql: ${TABLE}.`D60 Placed` ;;
  }

  dimension: d60_cancelled {
    type: number
    label: "D60 Cancelled"
    sql: ${TABLE}.`D60 Cancelled` ;;
  }

  dimension: d90_placed {
    type: number
    label: "D90 Placed"
    sql: ${TABLE}.`D90 Placed` ;;
  }

  dimension: d90_cancelled {
    type: number
    label: "D90 Cancelled"
    sql: ${TABLE}.`D90 Cancelled` ;;
  }

  set: detail {
    fields: [
      customer_name,
      customer_number,
      d7_placed,
      d7_cancelled,
      d15_placed,
      d15_cancelled,
      d30_placed,
      d30_cancelled,
      d60_placed,
      d60_cancelled,
      d90_placed,
      d90_cancelled
    ]
  }
}
