view: collections_report {
  derived_table: {
    sql: select
      bst.sector_name,
      bo.id as 'Order ID',
      bt.registration_number as 'Truck Num',
      date(oa.dt_added) as 'Accepted Date',
      date(ob.dt_added) as 'Blocked Date',
      date(bo.end_date) as 'Shipment Date',
      bo.status,
      cup.name as 'Customer Name', bup.mobile1 as 'Customer Mobile',
      blf.city as 'From City', blf.state as 'From State',
      tlf.city as 'To City', tlf.state as 'To State',
      ofd.payment_type,
      bo.tonnage,
      (case when adr.adhoc_rate > 4000 then adr.adhoc_rate/bo.tonnage else adr.adhoc_rate end) as 'Customer Adhoc Rate'
      from base_order bo
      left join base_customeruserprofile cup on cup.user_id = bo.user_id
      left join base_userprofile bup on cup.user_id = bup.user_id
      left join base_truck bt on bt.id = bo.assigned_truck_id
      left join base_location blf on blf.id = bo.from_city_id
      left join base_location tlf on tlf.id = bo.to_city_id
      left join base_sectortype bst on bst.id = bo.customer_sector_id
      left join base_status oa on oa.order_id = bo.id and oa.status = 'Order Accepted'
      left join base_status ob on ob.order_id = bo.id and ob.status = 'Order Blocked'
      left join base_orderfinancedetails ofd on ofd.order_id = bo.id
      left join base_adhocorderrates adr on adr.id = bo.adhoc_rate_reference_id
      where (date(oa.dt_added) >= '2017-12-15' or date(ob.dt_added) >= '2017-12-15')
      and bo.status not in ('Cancelled By Customer','Cancelled','Order Processing','KAM Review','Ops Review','Order Incomplete')
      bst.business_type_id = 1
       ;;
  }


  dimension: sector_name {
    type: string
    sql: ${TABLE}.sector_name ;;
  }

  dimension: order_id {
    type: number
    label: "Order ID"
    sql: ${TABLE}.`Order ID` ;;
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

  dimension: blocked_date {
    type: date
    label: "Blocked Date"
    sql: ${TABLE}.`Blocked Date` ;;
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

  dimension: customer_name {
    type: string
    label: "Customer Name"
    sql: ${TABLE}.`Customer Name` ;;
  }

  dimension: customer_mobile {
    type: number
    label: "Customer Mobile"
    sql: ${TABLE}.`Customer Mobile` ;;
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

  dimension: payment_type {
    type: number
    sql: ${TABLE}.payment_type ;;
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


}
