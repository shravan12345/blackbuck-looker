view: to_pay_driver_commission {
  derived_table: {
    sql: select
      bo.id as 'Order Id',
      date(bo.end_date) as 'Shipment Date',
      bt.registration_number as 'Truck Num',
      bo.status as 'Order Status',
      ofd.commission as 'Order Commission',
      tt.dt_added as 'Truck In-Transit Time',
      blf.city as 'From City',
      tlf.city as 'To City'
      from base_order bo
      left join base_truck bt on bt.id = bo.assigned_truck_id
      left join base_orderfinancedetails ofd on ofd.order_id = bo.id
      left join base_status tt on tt.order_id = bo.id and tt.status = 'Truck In-Transit'
      left join base_location blf on blf.id = bo.from_city_id
      left join base_location tlf on tlf.id = bo.to_city_id
      where date(bo.end_date) >= '2018-04-17'
      and bo.status not in ('Cancelled By Customer','Cancelled','Order Processing','KAM Review','Ops Review','Order Incomplete')
      and ofd.payment_type in (1,6)
       ;;
  }



  dimension: order_id {
    type: number
    label: "Order Id"
    sql: ${TABLE}.`Order Id` ;;
  }

  dimension: shipment_date {
    type: date
    label: "Shipment Date"
    sql: ${TABLE}.`Shipment Date` ;;
  }

  dimension: truck_num {
    type: string
    label: "Truck Num"
    sql: ${TABLE}.`Truck Num` ;;
  }

  dimension: from_city {
    type: string
    label: "From City"
    sql: ${TABLE}.`From City` ;;
  }

  dimension: to_city {
    type: string
    label: "To City"
    sql: ${TABLE}.`To City` ;;
  }

  dimension: order_status {
    type: string
    label: "Order Status"
    sql: ${TABLE}.`Order Status` ;;
  }

  dimension: order_commission {
    type: number
    label: "Order Commission"
    sql: ${TABLE}.`Order Commission` ;;
  }

  dimension_group: truck_intransit_time {
    type: time
    label: "Truck In-Transit Time"
    sql: ${TABLE}.`Truck In-Transit Time` ;;
  }


}
