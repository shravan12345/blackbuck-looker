view: topay_payment_followup {
  derived_table: {
    sql: select
bo.id as 'Order_Id',
bt.registration_number as 'Truck_Num',
date(oa.dt_added) as 'Accepted_Date',
date(adv.dt_added) + interval (bo.distance/350000) day as 'Destination_ETA',
bo.status as 'Current_Status',
blf.city as 'From_City',
tlf.city as 'To_City',
adv.driver_number as 'Driver_Num',
bup.name as 'SP_Name',
au.username as 'SP_Num',
bupc.name as 'Cust_Name',
auc.username as 'Cust_Num',
bo.tonnage as 'Tonnage',
eb.unit_price as 'Handshake_Price',
elu.contact_person_name as 'POC_Name',
elu.contact_person_number as 'POC_Number'
from base_order bo
join newbb.enquiry_order eo on eo.id = bo.client_handshake_order_id
left join base_truck bt on bt.id = bo.assigned_truck_id
left join base_location blf on blf.id = bo.from_city_id
left join base_location tlf on tlf.id = bo.to_city_id
left join base_status oa on oa.order_id = bo.id and oa.status = 'Order Accepted'
left join base_status adv on adv.order_id = bo.id and adv.status = 'Advance DocVerification'
left join newbb.enquiry_orderrequest eor on eo.order_request_id = eor.id
left join newbb.enquiry_bid eb on eo.bid_id = eb.id
left join newbb.base_userprofile bup on eb.supply_partner_id = bup.user_id
left join newbb.auth_user au on au.id = bup.user_id
left join newbb.base_userprofile bupc on eor.customer_id = bupc.user_id
left join newbb.auth_user auc on auc.id = bupc.user_id
left join base_orderfinancedetails ofd on ofd.order_id = bo.id
left join newbb.enquiry_loadingunloading elu on elu.order_request_id = eor.id and elu.poi_type = 2
where ofd.payment_type = 1
and bo.client_order_id is not null
and eor.cluster_id = 2
order by 3 desc ;;
  }

  dimension: Accepted_Date {
    type: date
    sql: ${TABLE}.Accepted_Date ;;
  }
  dimension: Order_Id {
    type: number
    sql: ${TABLE}.Order_Id ;;
  }

  dimension: Destination_ETA {
    type: date
    sql: ${TABLE}.Destination_ETA ;;
  }

  dimension: Truck_Num {
    type: string
    sql: ${TABLE}.Truck_Num ;;
  }

  dimension: Current_Status {
    type: string
    sql: ${TABLE}.Current_Status ;;
  }

  dimension: Driver_Num {
    type: number
    sql: ${TABLE}.Driver_Num ;;
  }

  dimension: SP_Name {
    type: string
    sql: ${TABLE}.SP_Name ;;
  }
  dimension: From_City {
    type: string
    sql: ${TABLE}.From_City ;;
  }
  dimension: Cust_Name {
    type: string
    sql: ${TABLE}.Cust_Name ;;
  }

  dimension: To_City {
    type: string
    sql: ${TABLE}.To_City ;;
  }

    dimension: Tonnage {
    type: number
    sql: ${TABLE}.Tonnage ;;
  }

  dimension: Cust_Num {
    type: number
    sql: ${TABLE}.Cust_Num ;;
  }

  dimension: SP_Num {
    type: number
    sql: ${TABLE}.SP_Num ;;
  }

  dimension: Handshake_Price {
    type: number
    sql: ${TABLE}.Handshake_Price ;;
  }

  dimension: POC_Name {
    type: string
    sql: ${TABLE}.POC_Name ;;
  }

  dimension: POC_Number {
    type: number
    sql: ${TABLE}.POC_Number ;;
  }
}
