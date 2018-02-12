view: transit_status_nw_orders {
  derived_table: {
    sql: select
      bo.id as 'GB Order Id',
      bo.status as 'Current Status',
      bt.registration_number as 'Truck Num',
      aus.first_name as 'SP Name',
      aus.username as 'SP Number',
      blf.city as 'From City', blf.state as 'From State',
      tlf.city as 'To City', tlf.state as 'To State',
      cup.name as 'Customer Name',
      pd.dt_added as 'Payment Done Time',
      bo.distance
      from base_order bo
      left join auth_user aus on aus.id = bo.supply_partner_id
      left join base_truck bt on bt.id = bo.assigned_truck_id
      left join base_location blf on blf.id = bo.from_city_id
      left join base_location tlf on tlf.id = bo.to_city_id
      left join base_customeruserprofile cup on cup.user_id = bo.user_id
      left join base_status pd on pd.order_id = bo.id and pd.status = 'Payment Done'
      left join base_sectortype bst on bst.id = bo.customer_sector_id
      left join base_orderfinancedetails ofd on ofd.order_id = bo.id
      where bo.status in ('Truck In-Transit','Truck Arrival Destination','Transit Issue','Truck Departure Destination')
      and ofd.payment_type <> 1
      and date(pd.dt_Added) between '2017-07-01' and (current_date()-interval 10 day)
      and (bst.id in (6,7,9,11,16,17,18,19) or blf.city in ('Ahmedabad','Anand','Himmatnagar','Palanpur','Sanand','Gandhinagar','Godhra','Halol','Himmatnagar','Kadi','Kalol','Matar','Mehsana','Vadgam','Vijapur','Anjar','Bhuj','Jamnagar','Jetpur','Jodiya','Lakhatar','Mundra','Rajkot','Ankleshwar','Dahej','Hazira','Bharuch','Jhagadia','Karjan','Surat','Vyara','Gurgaon','Hassangarh','Faridabad','Hisar','Panipat','Bahadurgarh','Gannaur','Karnal','Rohtak','Safidon','Sonipat','Alipur','Delhi','New Delhi','Jaipur','Newai','Chomu','Kishangarh','Niwai','Agucha','Chanderia','Dariba','Beawar','Bhilwara','Bikaner','Chittorgarh','Gulabpura','Kherwara','Kolayat','Rajsamand','Relmangra','Udaipur','Dasna','Ghaziabad'))
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

  dimension: current_status {
    type: string
    label: "Current Status"
    sql: ${TABLE}.`Current Status` ;;
  }

  dimension: truck_num {
    type: string
    label: "Truck Num"
    sql: ${TABLE}.`Truck Num` ;;
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

  dimension_group: payment_done_time {
    type: time
    label: "Payment Done Time"
    sql: ${TABLE}.`Payment Done Time` ;;
  }

  dimension: distance {
    type: string
    sql: ${TABLE}.distance ;;
  }

  set: detail {
    fields: [
      gb_order_id,
      current_status,
      truck_num,
      sp_name,
      sp_number,
      from_city,
      from_state,
      to_city,
      to_state,
      customer_name,
      distance
    ]
  }
}
