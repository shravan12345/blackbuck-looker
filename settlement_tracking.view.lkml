view: settlement_tracking {
  derived_table: {
    sql: select
      bo.id as 'Order Id',
      (case when bst.business_type_id = 1 then 'Spot' when bst.business_type_id = 2 then 'Contract' end) as 'Business Type',
      bt.registration_number as 'Truck Num',
      bo.status as 'Current Status',
      aus.first_name as 'SP Name',
      aus.username as 'SP Number',
      blf.city as 'From City', blf.state as 'From State',
      tlf.city as 'To City', tlf.state as 'To State',
      cup.name as 'Customer Name',
      pd.dt_added as 'Payment Done Time',
      sdv.dt_added as 'Settlement DocVerification Time',
      sd.dt_added as 'Settlement Done Time',
      bo.distance,
      ofd.payment_type,
      bod.document_status as 'POD_Status',
      aup.email as 'Updated_By'
      from base_order bo
      left join auth_user aus on aus.id = bo.supply_partner_id
      left join base_truck bt on bt.id = bo.assigned_truck_id
      left join base_location blf on blf.id = bo.from_city_id
      left join base_location tlf on tlf.id = bo.to_city_id
      left join base_customeruserprofile cup on cup.user_id = bo.user_id
      left join base_status pd on pd.order_id = bo.id and pd.status = 'Payment Done'
      left join base_status sd on sd.order_id = bo.id and sd.status = 'Settlement Done'
      left join base_sectortype bst on bst.id = bo.customer_sector_id
      left join base_orderfinancedetails ofd on ofd.order_id = bo.id
      left join base_orderdocument bod on bod.order_id = bo.id and bod.document_type = 2
      left join auth_user aup on aup.id = bod.last_modified_by_id
      left join
      (
      select order_id, min(dt_Added) as 'dt_added' from base_status where status = 'Settlement DocVerification' group by 1
      ) sdv on sdv.order_id = bo.id
      where date(sdv.dt_Added) >= '2018-01-01'
      and ofd.payment_type <> 1
      and (bst.id in (6,7,9,11,16,17,18,19) or blf.city in ('Ahmedabad','Anand','Himmatnagar','Palanpur','Sanand','Gandhinagar','Godhra','Halol','Himmatnagar','Kadi','Kalol','Matar','Mehsana','Vadgam','Vijapur','Anjar','Bhuj','Jamnagar','Jetpur','Jodiya','Lakhatar','Mundra','Rajkot','Ankleshwar','Dahej','Hazira','Bharuch','Jhagadia','Karjan','Surat','Vyara','Gurgaon','Hassangarh','Faridabad','Hisar','Panipat','Bahadurgarh','Gannaur','Karnal','Rohtak','Safidon','Sonipat','Alipur','Delhi','New Delhi','Jaipur','Newai','Chomu','Kishangarh','Niwai','Agucha','Chanderia','Dariba','Beawar','Bhilwara','Bikaner','Chittorgarh','Gulabpura','Kherwara','Kolayat','Rajsamand','Relmangra','Udaipur','Dasna','Ghaziabad'))
       ;;
  }

  dimension: order_id {
    type: string
    label: "Order Id"
    sql: ${TABLE}.`Order Id` ;;
  }

  dimension: current_status {
    type: string
    label: "Current Status"
    sql: ${TABLE}.`Current Status` ;;
  }

  dimension: pod_status {
    type: string
    sql: ${TABLE}.`POD_Status` ;;
  }

  dimension: updated_by {
    type: string
    sql: ${TABLE}.`Updated_By` ;;
  }

  dimension: business_type {
    type: string
    label: "Business Type"
    sql: ${TABLE}.`Business Type` ;;
  }

  dimension: payment_type {
    type: number
    sql: ${TABLE}.payment_type ;;
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

  dimension: payment_done_time {
    type: string
    label: "Payment Done Time"
    sql: ${TABLE}.`Payment Done Time` ;;
  }

  dimension: settlement_doc_verification_time {
    type: string
    label: "Settlement DocVerification Time"
    sql: ${TABLE}.`Settlement DocVerification Time` ;;
  }

  dimension: settlement_done_time {
    type: string
    label: "Settlement Done Time"
    sql: ${TABLE}.`Settlement Done Time` ;;
  }

  dimension: distance {
    type: string
    sql: ${TABLE}.distance ;;
  }


}
