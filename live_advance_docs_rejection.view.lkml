view: live_advance_docs_rejection {
  derived_table: {
    sql: select
      bo.id as 'GB Order Id',
      (case when oa.dt_added is null then date(ob.dt_added) else date(oa.dt_added) end) as 'Accepted Date',
      bo.status,
      bt.registration_number as 'Truck Num',
      aus.first_name as 'SP Name',
      aus.username as 'SP Number',
      advr.driver_name as 'Driver Name',
      advr.driver_number as 'Driver Number',
      blf.city as 'From City', blf.state as 'From State',
      tlf.city as 'To City', tlf.state as 'To State',
      cup.name as 'Customer Name',
      advr.dt_added as 'ADV Rejected Time',
      bstr.reason as 'Rejection Reason',
      bsh.transition_comment as 'Rejection Comment'
      from base_order bo
      left join auth_user aus on aus.id = bo.supply_partner_id
      left join base_truck bt on bt.id = bo.assigned_truck_id
      left join base_location blf on blf.id = bo.from_city_id
      left join base_location tlf on tlf.id = bo.to_city_id
      left join base_status oa on oa.order_id = bo.id and oa.status = 'Order Accepted'
      left join base_status ob on ob.order_id = bo.id and ob.status = 'Order Blocked'
      left join base_status advr on advr.order_id = bo.id and advr.status = 'Advance Docs Rejected'
      left join base_customeruserprofile cup on cup.user_id = bo.user_id
      left join base_statushistory bsh on bsh.order_id = bo.id and bsh.status = 'Advance Docs Rejected'
      left join base_statustransitionreasons bstr on bsh.transition_reason_enum = bstr.id
      where bo.status = 'Advance Docs Rejected'
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

  dimension: accepted_date {
    type: date
    label: "Accepted Date"
    sql: ${TABLE}.`Accepted Date` ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
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

  dimension: driver_name {
    type: string
    label: "Driver Name"
    sql: ${TABLE}.`Driver Name` ;;
  }

  dimension: driver_number {
    type: string
    label: "Driver Number"
    sql: ${TABLE}.`Driver Number` ;;
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

  dimension: adv_rejected_time {
    type: string
    label: "ADV Rejected Time"
    sql: ${TABLE}.`ADV Rejected Time` ;;
  }

  dimension: rejection_reason {
    type: string
    label: "Rejection Reason"
    sql: ${TABLE}.`Rejection Reason` ;;
  }

  dimension: rejection_comment {
    type: string
    label: "Rejection Comment"
    sql: ${TABLE}.`Rejection Comment` ;;
  }

  set: detail {
    fields: [
      gb_order_id,
      accepted_date,
      status,
      truck_num,
      sp_name,
      sp_number,
      driver_name,
      driver_number,
      from_city,
      from_state,
      to_city,
      to_state,
      customer_name,
      adv_rejected_time,
      rejection_reason,
      rejection_comment
    ]
  }
}
