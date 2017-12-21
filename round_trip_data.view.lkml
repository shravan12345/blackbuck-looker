view: round_trip_data {
  derived_table: {
    sql: select
      bo.id as 'GB Order Id',
      date(oa.dt_added) as 'Accepted Date',
      date(ob.dt_added) as 'Blocked Date',
      date(adv.dt_added) as 'Advance DocVerification',
      bt.registration_number as 'Truck_Num',
      bo.status,
      blf.city as 'From City', blf.state as 'From State',
      tlf.city as 'To City', tlf.state as 'To State',
      concat(ifnull(aus.first_name,"")," ",ifnull(aus.last_name,"")) as 'SP Name',
      aus.username as 'SP Num',
      bupd.mobile1 as 'Driver Number'
      from base_order bo
      left join base_truck bt on bt.id = bo.assigned_truck_id
      left join base_location blf on blf.id = bo.from_city_id
      left join base_location tlf on tlf.id = bo.to_city_id
      left join base_status oa on oa.order_id = bo.id and oa.status = 'Order Accepted'
      left join base_status ob on ob.order_id = bo.id and ob.status = 'Order Blocked'
      left join base_status adv on adv.order_id = bo.id and adv.status = 'Advance DocVerification'
      left join auth_user aus on aus.id = bo.supply_partner_id
      left join base_userprofile bupd on bupd.user_id = bo.assigned_driver_id
      where blf.state in ('Gujarat','Haryana','Uttar Pradesh','Uttarakhand','Rajasthan','Punjab','Delhi')
      and tlf.state in ('Gujarat','Haryana','Uttar Pradesh','Uttarakhand','Rajasthan','Punjab','Delhi')
      and (
      date(adv.dt_added) between (current_date()-interval 8 day) and current_date()
      or date(oa.dt_added) between (current_date()-interval 8 day) and current_date()
      or date(ob.dt_added) between (current_date()-interval 8 day) and current_date()
      )
       ;;
  }


  dimension: gb_order_id {
    type: number
    label: "GB Order Id"
    sql: ${TABLE}.`GB Order Id` ;;
  }

  dimension: sp_num {
    type: number
    label: "SP Num"
    sql: ${TABLE}.`SP Num` ;;
  }

  dimension: driver_number {
    type: number
    label: "Driver Number"
    sql: ${TABLE}.`Driver Number` ;;
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

  dimension: advance_doc_verification {
    type: date
    label: "Advance DocVerification"
    sql: ${TABLE}.`Advance DocVerification` ;;
  }

  dimension: truck_num {
    type: string
    sql: ${TABLE}.Truck_Num ;;
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

  dimension: sp_name {
    type: string
    label: "SP Name"
    sql: ${TABLE}.`SP Name` ;;
  }


}
