view: supply_performance_tracker {
  derived_table: {
    sql: select
      bo.id as 'GB Order Id',
      (case when oa.dt_added is null then date(ob.dt_added) else date(oa.dt_added) end) as 'Accepted Date',
      bo.status,
      aus.first_name as 'SP Name',
      aus.username as 'SP Number',
      blf.city as 'From City', bt.registration_number as 'From State',
      tlf.city as 'To City', ofd.commission as 'To State',
      (case when adr.adhoc_rate is null then bop.total_revenue/bo.tonnage when adr.adhoc_rate > 4000 then adr.adhoc_rate/bo.tonnage else adr.adhoc_rate end) as 'Customer Adhoc Rate',
      (case when ofd.per_ton_rate is null then ofd.freight_amount/bo.tonnage else ofd.per_ton_rate end) as 'Supply Per Ton Rate',
      bo.tonnage,
      blf.state as 'F_State',
      tlf.state as 'T_State',
      bst.sector_name,
      bbt.business_name,
      cup.name as 'Customer_Name',
      pd.dt_added as 'Payment Done Date'
      from base_order bo
      left join base_truck bt on bt.id = bo.assigned_truck_id
      left join auth_user aus on aus.id = bo.supply_partner_id
      left join base_location blf on blf.id = bo.from_city_id
      left join base_location tlf on tlf.id = bo.to_city_id
      left join base_status oa on oa.order_id = bo.id and oa.status = 'Order Accepted'
      left join base_status ob on ob.order_id = bo.id and ob.status = 'Order Blocked'
      left join base_status pd on pd.order_id = bo.id and pd.status = 'Payment Done'
      left join base_orderfinancedetails ofd on ofd.order_id = bo.id
      left join base_adhocorderrates adr on adr.id = bo.adhoc_rate_reference_id
      left join base_orderprofitability bop on bop.order_id = bo.id
      left join base_customeruserprofile cup on cup.user_id = bo.user_id
      left join base_sectortype bst on bst.id = cup.sector_type_id
      left join base_businesstype bbt on bbt.id = bst.business_type_id
      where date(pd.dt_added) >= (current_date()-interval 32 day)
      and blf.city in ('Anjar','Mundra','Jodiya','Jamnagar','Siddhpur','Jetpur','Bhachau','Rajkot','Bhuj','Karnal','Safidon','Sri Muktsar Sahib','Rajsamand','Udaipur','Kolayat','Bikaner','Beawar','Kherwara','Kishangarh','Parbatsar','Bhilwara','Vallabhnagar','Sri Muktsar Sahib','Ferozepur','New Delhi')
      and bo.status not in ('Cancelled By Customer','Cancelled','Order Processing','KAM Review','Ops Review','Order Incomplete')
       ;;
  }

  dimension: F_State {
    type: string
    sql: ${TABLE}.F_State ;;
  }

  dimension: payment_done_date {
    type: date
    label: "Payment Done Date"
    sql: ${TABLE}.`Payment Done Date` ;;
  }

  dimension: T_State {
    type: string
    sql: ${TABLE}.T_State ;;
  }

  dimension: Customer_Name {
    type: string
    sql: ${TABLE}.Customer_Name ;;
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
    type: number
    label: "To State"
    sql: ${TABLE}.`To State` ;;
  }

}
