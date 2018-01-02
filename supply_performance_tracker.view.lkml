view: supply_performance_tracker {
  derived_table: {
    sql: select
      bo.id as 'GB Order Id',
      (case when oa.dt_added is null then date(ob.dt_added) else date(oa.dt_added) end) as 'Accepted Date',
      bo.status,
      aus.first_name as 'SP Name',
      aus.username as 'SP Number',
      blf.city as 'From City', blf.state as 'From State',
      tlf.city as 'To City', tlf.state as 'To State'
      from base_order bo
      left join auth_user aus on aus.id = bo.supply_partner_id
      left join base_location blf on blf.id = bo.from_city_id
      left join base_location tlf on tlf.id = bo.to_city_id
      left join base_status oa on oa.order_id = bo.id and oa.status = 'Order Accepted'
      left join base_status ob on ob.order_id = bo.id and ob.status = 'Order Blocked'
      where (date(oa.dt_added) >= (current_date()-interval 30 day) or date(ob.dt_added) >= (current_date()-interval 30 day))
      and blf.city in ('Anjar','Mundra','Jodiya','Jamnagar','Siddhpur','Jetpur','Bhachau','Rajkot','Bhuj','Karnal','Safidon','Sri Muktsar Sahib','Rajsamand','Udaipur','Kolayat','Bikaner','Beawar','Kherwara','Kishangarh','Parbatsar','Bhilwara','Vallabhnagar','Sri Muktsar Sahib','Ferozepur','New Delhi')
      and aus.username in
      (
      select au.username from newbb.auth_user au left join newbb.base_userprofile bup on bup.user_id = au.id where bup.profile_type in ('fleet_owner','transport_contractor')
      )
      and bo.status not in ('Cancelled By Customer','Cancelled','Order Processing','KAM Review','Ops Review','Order Incomplete')
       ;;
  }

  dimension: gb_order_id {
    type: number
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
