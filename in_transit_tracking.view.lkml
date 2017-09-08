view: in_transit_tracking {
  derived_table: {
    sql: select tts.order_id, date(bo.end_date) as 'Shipment_Date', tts.dt_added as 'Call_Time', tts.call_status,
tts.called_to, tts.secondary_status, tts.comments,
blf.city as 'From_City', blf.state as 'From_State',
tlf.city as 'To_City', tlf.state as 'To_State',
bs.driver_number, aus.username as 'SP_Number'
from base_trucktrackstatus tts
left join base_order bo on bo.id = tts.order_id
left join base_location blf on blf.id = bo.from_city_id
left join base_location tlf on tlf.id = bo.to_city_id
left join base_orderfinancedetails ofd on ofd.order_id = bo.id
left join base_truck bt on bt.id = bo.assigned_truck_id
left join base_status bs on bs.order_id = bo.id and bs.status = bo.status
left join auth_user aus on aus.id = bo.supply_partner_id
where date(bo.end_date) between (current_date()-interval 15 day) and (current_date()-interval 1 day)
and ofd.payment_type = 1
and blf.city in ('Anjar','Bhuj','Mundra','Jodiya','Bhachau') ;;
  }

  dimension: Shipment_Date {
    type: date
    sql: ${TABLE}.Shipment_Date ;;
  }
  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }
  dimension_group: Call_Time {
    type: time
    timeframes: [time, date, week, month, hour, hour_of_day, raw, day_of_week]
    sql: ${TABLE}.Call_Time ;;
  }
  dimension: call_status {
    type: string
    sql: ${TABLE}.call_status ;;
  }

  dimension: called_to {
    type: string
    sql: ${TABLE}.called_to ;;
  }

  dimension: secondary_status {
    type: number
    sql: ${TABLE}.secondary_status ;;
  }

  dimension: comments {
    type: string
    sql: ${TABLE}.comments ;;
  }
  dimension: From_City {
    type: string
    sql: ${TABLE}.From_City ;;
  }
  dimension: From_State {
    type: string
    sql: ${TABLE}.From_State ;;
  }

  dimension: To_City {
    type: string
    sql: ${TABLE}.To_City ;;
  }

  dimension: To_State {
    type: string
    sql: ${TABLE}.To_State ;;
  }

  dimension: driver_number {
    type: number
    sql: ${TABLE}.driver_number ;;
  }

  dimension: SP_Number {
    type: number
    sql: ${TABLE}.SP_Number ;;
  }
}
