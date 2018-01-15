view: demand_team_performance_tracker {
  derived_table: {
    sql: select distinct bst.sector_name, cup.name as 'Customer Name', bup.mobile1 as 'Mobile',
      bo.id as 'Order ID',
      (case when oa.dt_added is null then date(ob.dt_added) else date(oa.dt_added) end) as 'Accepted Date',
      ofd.commission as 'status',
      bo.tonnage,
      (case when adr.adhoc_rate > 4000 then adr.adhoc_rate/bo.tonnage else adr.adhoc_rate end) as 'Customer Adhoc Rate',
      (case when ofd.per_ton_rate is null then ofd.freight_amount/bo.tonnage else ofd.per_ton_rate end) as 'Supply Per Ton Rate',
      pd.dt_added as 'Payment Done Date'
      from base_order bo
      left join base_customeruserprofile cup on cup.user_id = bo.user_id
      left join base_userprofile bup on cup.user_id = bup.user_id
      left join base_sectortype bst on bst.id = bo.customer_sector_id
      left join base_location blf on blf.id = bo.from_city_id
      left join base_location tlf on tlf.id = bo.to_city_id
      left join base_status oa on oa.order_id = bo.id and oa.status = 'Order Accepted'
      left join base_status ob on ob.order_id = bo.id and ob.status = 'Order Blocked'
      left join base_status pd on pd.order_id = bo.id and pd.status = 'Payment Done'
      left join base_orderfinancedetails ofd on ofd.order_id = bo.id
      left join base_adhocorderrates adr on adr.id = bo.adhoc_rate_reference_id
      where (date(oa.dt_added) >= (current_date()-interval 40 day) or date(ob.dt_added) >= (current_date()-interval 40 day))
      and bo.status not in ('Cancelled By Customer','Cancelled','Order Processing','KAM Review','Ops Review','Order Incomplete')
      and bst.id in (6,7,9,11,16)
       ;;
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

  dimension: mobile {
    type: number
    sql: ${TABLE}.Mobile ;;
  }

  dimension: order_id {
    type: number
    label: "Order ID"
    sql: ${TABLE}.`Order ID` ;;
  }

  dimension: accepted_date {
    type: date
    label: "Accepted Date"
    sql: ${TABLE}.`Accepted Date` ;;
  }

  dimension: payment_done_date {
    type: date
    label: "Payment Done Date"
    sql: ${TABLE}.`Payment Done Date` ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
  }

  dimension: tonnage {
    type: number
    sql: ${TABLE}.tonnage ;;
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


}
