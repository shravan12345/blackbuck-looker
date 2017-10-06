view: deep_script {
  derived_table: {
    sql: select date(oa.dt_added) as 'Date', m.id as 'Order_ID', m.status as 'Current_Status',
(case when timestampdiff(minute, oa.dt_added, tas.dt_added) <= 120 then "a. Less than 2 hour"
    when timestampdiff(minute, oa.dt_added, tas.dt_added) between 121 and 240 then "b. 2 hour - 4 hours"
      when timestampdiff(minute, oa.dt_added, tas.dt_added) between 241 and 480 then "c. 4 hour - 8 hours"
      when timestampdiff(minute, oa.dt_added, tas.dt_added) between 481 and 1080 then "d. 8 hour - 18 hours"
      when timestampdiff(minute, oa.dt_added, tas.dt_added) is null then "aaNA"
      else "e. More than 18 hours" end) as 'TA_TAS',
(case when timestampdiff(minute, tas.dt_added, pd.dt_added) < 480 then "a. Less than 8 hour"
    when timestampdiff(minute, tas.dt_added, pd.dt_added) between 481 and 960 then "b. 8 hour - 16 hours"
      when timestampdiff(minute, tas.dt_added, pd.dt_added) between 961 and 1440 then "c. 16 hour - 24 hours"
      when timestampdiff(minute, tas.dt_added, pd.dt_added) between 1441 and 2160 then "d. 24 hour - 36 hours"
      when timestampdiff(minute, tas.dt_added, pd.dt_added) is null then "aaNA"
      else "e. More than 36 hours" end) as 'TAS_PD',
(case when timestampdiff(minute, tas.dt_added, adv.dt_added) < 360 then "a. Less than 6 hour"
    when timestampdiff(minute, tas.dt_added, adv.dt_added) between 1081 and 1440 then "d. 18 hour - 24 hours"
      when timestampdiff(minute, tas.dt_added, adv.dt_added) between 361 and 720 then "b. 6 hour - 12 hours"
      when timestampdiff(minute, tas.dt_added, adv.dt_added) between 721 and 1080 then "c. 12 hour - 18 hours"
      when timestampdiff(minute, tas.dt_added, adv.dt_added) is null then "aaNA"
      else "e. More than 24 hours" end) as 'TAS_ADV',
(case when timestampdiff(minute, adv.dt_added, pp.dt_added) < 30 then "a. Less than 30 mins"
    when timestampdiff(minute, adv.dt_added, pp.dt_added) between 31 and 60 then "b. 30 mins - 1 hour"
      when timestampdiff(minute, adv.dt_added, pp.dt_added) between 61 and 120 then "c. 1 hour - 2 hours"
      when timestampdiff(minute, adv.dt_added, pp.dt_added) between 121 and 240 then "d. 2 hours - 4 hours"
      when timestampdiff(minute, adv.dt_added, pp.dt_added) is null then "aaNA"
      else "e. More than 4 hours" end) as 'ADV_PP',
(case when timestampdiff(minute, pp.dt_added, pd.dt_added) < 30 then "a. Less than 30 mins"
    when timestampdiff(minute, pp.dt_added, pd.dt_added) between 31 and 60 then "b. 30 mins - 1 hour"
      when timestampdiff(minute, pp.dt_added, pd.dt_added) between 61 and 120 then "c. 1 hour - 2 hours"
      when timestampdiff(minute, pp.dt_added, pd.dt_added) between 121 and 240 then "d. 2 hours - 4 hours"
      when timestampdiff(minute, pp.dt_added, pd.dt_added) is null then "aaNA"
      else "e. More than 4 hours" end) as 'PP_PD',
(case when timestampdiff(minute, adv.dt_added, pd.dt_added) < 30 then "a. Less than 30 mins"
    when timestampdiff(minute, adv.dt_added, pd.dt_added) between 31 and 60 then "b. 30 mins - 1 hour"
      when timestampdiff(minute, adv.dt_added, pd.dt_added) between 61 and 120 then "c. 1 hour - 2 hours"
      when timestampdiff(minute, adv.dt_added, pd.dt_added) between 121 and 240 then "d. 2 hours - 4 hours"
      when timestampdiff(minute, adv.dt_added, pd.dt_added) is null then "aaNA"
      else "e. More than 4 hours" end) as 'ADV_PD'
from base_order m
left join (select order_id, dt_added
FROM `base_status` WHERE status = "Advance DocVerification") as adv on adv.order_id = m.id
left join (select order_id, dt_added
FROM `base_status` WHERE status = "Truck Arrival Source") as tas on tas.order_id = m.id
left join (select order_id, dt_added
FROM `base_status` WHERE status = "Payment Pending") as pp on pp.order_id = m.id
left join (select order_id, dt_added
FROM `base_status` WHERE status = "Payment Done") as pd on pd.order_id = m.id
left join (select order_id, dt_added
FROM `base_status` WHERE status = "Order Accepted") as oa on oa.order_id = m.id
where date(oa.dt_added) > '2017-09-16'
and m.from_city_id in (557,559,562) ;;
  }

  dimension: Date {
    type: date
    sql: ${TABLE}.Date ;;
  }
  dimension: Order_ID {
    type: number
    sql: ${TABLE}.Order_ID ;;
  }
  dimension: Current_status {
    type: string
    sql: ${TABLE}.Current_Status ;;
  }
  dimension: TA_TAS {
    type: string
    sql: ${TABLE}.TA_TAS ;;
  }

  dimension: TAS_PD {
    type: string
    sql: ${TABLE}.TAS_PD ;;
  }

  dimension: TAS_ADV {
    type: string
    sql: ${TABLE}.TAS_ADV ;;
  }
  dimension: ADV_PP {
    type: string
    sql: ${TABLE}.ADV_PP ;;
  }
  dimension: PP_PD {
    type: string
    sql: ${TABLE}.PP_PD ;;
  }

  dimension: ADV_PD {
    type: string
    sql: ${TABLE}.ADV_PD ;;
  }
}
