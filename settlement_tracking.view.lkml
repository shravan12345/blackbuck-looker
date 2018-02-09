view: settlement_tracking {
  derived_table: {
    sql: select
      bo.id as 'GB Order Id',
      bt.registration_number as 'Truck Num',
      aus.first_name as 'SP Name',
      aus.username as 'SP Number',
      blf.city as 'From City', blf.state as 'From State',
      tlf.city as 'To City', tlf.state as 'To State',
      cup.name as 'Customer Name',
      pd.dt_added as 'Payment Done Time',
      sdv.dt_added as 'Settlement DocVerification Time',
      sd.dt_added as 'Settlement Done Time',
      bo.distance
      from base_order bo
      left join auth_user aus on aus.id = bo.supply_partner_id
      left join base_truck bt on bt.id = bo.assigned_truck_id
      left join base_location blf on blf.id = bo.from_city_id
      left join base_location tlf on tlf.id = bo.to_city_id
      left join base_customeruserprofile cup on cup.user_id = bo.user_id
      left join base_status pd on pd.order_id = bo.id and pd.status = 'Payment Done'
      left join base_status sd on sd.order_id = bo.id and sd.status = 'Settlement Done'
      left join base_sectortype bst on bst.id = bo.customer_sector_id
      left join
      (
      select order_id, min(dt_Added) as 'dt_added' from base_status where status = 'Settlement DocVerification' group by 1
      ) sdv on sdv.order_id = bo.id
      where date(sd.dt_Added) >= (current_date()-interval 30 day)
      and bst.id in (6,7,9,11,16,17)
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

  set: detail {
    fields: [
      gb_order_id,
      truck_num,
      sp_name,
      sp_number,
      from_city,
      from_state,
      to_city,
      to_state,
      customer_name,
      payment_done_time,
      settlement_doc_verification_time,
      settlement_done_time,
      distance
    ]
  }
}
