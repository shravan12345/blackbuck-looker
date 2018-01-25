view: fo_contract_rajasthan {
  derived_table: {
    sql: select
      aus.first_name as 'SP Name',
      bt.registration_number as 'Truck Num',
      bo.id as 'GB Order Id',
      (case when oa.dt_added is null then date(ob.dt_added) else date(oa.dt_added) end) as 'Accepted Date',
      bo.status,
      blf.city as 'From City', blf.state as 'From State',
      tlf.city as 'To City', tlf.state as 'To State',
      bp.name as 'product',
      adv.dt_Added as 'DAVT_Time',
      adr.adhoc_rate as 'Customer Adhoc Rate',
      (case when ofd.per_ton_rate is null then ofd.freight_amount/bo.tonnage else ofd.per_ton_rate end) as 'Supply Per Ton Rate',
      bo.tonnage,
      ofd.commission,
      c.amount as 'Deductible',
      ofd.payment_type
      from base_order bo
      left join base_truck bt on bt.id = bo.assigned_truck_id
      left join base_location blf on blf.id = bo.from_city_id
      left join base_location tlf on tlf.id = bo.to_city_id
      left join base_status oa on oa.order_id = bo.id and oa.status = 'Order Accepted'
      left join base_status ob on ob.order_id = bo.id and ob.status = 'Order Blocked'
      left join base_status adv on adv.order_id = bo.id and adv.status = 'Advance DocVerification'
      left join base_orderfinancedetails ofd on ofd.order_id = bo.id
      left join auth_user aus on aus.id = bo.supply_partner_id
      left join base_product bp on bp.id = bo.product_id
      left join base_adhocorderrates adr on adr.id = bo.adhoc_rate_reference_id
      left join payment.payment_order po on po.oms_order_id = bo.id
      left join payment.charge c on c.payment_order_id = po.id and c.type = 10
      where (date(oa.dt_added) >= '2018-01-10' or date(ob.dt_added) >= '2018-01-10')
      and bo.status not in ('Cancelled By Customer','Cancelled','Order Processing','KAM Review','Ops Review','Order Incomplete')
      and aus.username in (9785916984,9829666303)
      order by 4 desc,1
       ;;
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

  dimension: supply_per_ton_rate {
    type: number
    label: "Supply Per Ton Rate"
    sql: ${TABLE}.`Supply Per Ton Rate` ;;
  }

  dimension: customer_adhoc_rate {
    type: number
    label: "Customer Adhoc Rate"
    sql: ${TABLE}.`Customer Adhoc Rate` ;;
  }

  dimension: tonnage {
    type: number
    sql: ${TABLE}.tonnage ;;
  }

  dimension: commission {
    type: number
    sql: ${TABLE}.commission ;;
  }

  dimension: Deductible {
    type: number
    sql: ${TABLE}.Deductible ;;
  }

  dimension: payment_type {
    type: number
    sql: ${TABLE}.payment_type ;;
  }


}
