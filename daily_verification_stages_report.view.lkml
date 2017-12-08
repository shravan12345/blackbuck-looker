view: daily_verification_stages_report {
  derived_table: {
    sql: select
      t.tov_date as 'Date',
      t.Truck_Owner_Verification,
      t.Waiting_for_Loading,
      t.Truck_Owner_Verification_Rejected,
      a.Advance_DocVerification,
      a.Payment_Pending,
      a.Advance_Docs_Rejected,
      s.Settlement_DocVerification,
      s.Settlement_Pending,
      s.Settlement_Docs_Rejected
      from (
      select date(tov.dt_added) as 'tov_date',
      count(distinct tov.order_id) as 'Truck_Owner_Verification',
      count(distinct wfl.order_id) as 'Waiting_for_Loading',
      count(distinct tovr.order_id) as 'Truck_Owner_Verification_Rejected'
      from base_order bo
      left join base_status tov on tov.order_id = bo.id and tov.status = 'Truck Owner Verification'
      left join base_status wfl on wfl.order_id = bo.id and wfl.status = 'Waiting for Loading'
      left join base_status tovr on tovr.order_id = bo.id and tovr.status = 'Truck Owner Verification Rejected'
      where date(addtime(tov.dt_added, "0 05:30:00")) >= '2017-12-01'
      group by 1
      ) t
      left join(
      select date(adv.dt_added) as 'adv_date',
      count(distinct adv.order_id) as 'Advance_DocVerification',
      count(distinct pp.order_id) as 'Payment_Pending',
      count(distinct adr.order_id) as 'Advance_Docs_Rejected'
      from base_order bo
      left join base_status adv on adv.order_id = bo.id and adv.status = 'Advance DocVerification'
      left join base_status pp on pp.order_id = bo.id and pp.status = 'Payment Pending'
      left join base_status adr on adr.order_id = bo.id and adr.status = 'Advance Docs Rejected'
      where date(addtime(adv.dt_added, "0 05:30:00")) >= '2017-12-01'
      group by 1
      ) a on a.adv_date = t.tov_date
      left join(
      select date(sdv.dt_added) as 'sdv_date',
      count(distinct sdv.order_id) as 'Settlement_DocVerification',
      count(distinct sp.order_id) as 'Settlement_Pending',
      count(distinct sdr.order_id) as 'Settlement_Docs_Rejected'
      from base_order bo
      left join base_status sdv on sdv.order_id = bo.id and sdv.status = 'Settlement DocVerification'
      left join base_status sp on sp.order_id = bo.id and sp.status = 'Settlement Pending'
      left join base_status sdr on sdr.order_id = bo.id and sdr.status = 'Settlement Docs Rejected'
      where date(addtime(sdv.dt_added, "0 05:30:00")) >= '2017-12-01'
      group by 1
      ) s on s.sdv_date = t.tov_date
      group by 1
       ;;
  }


  dimension: date {
    type: date
    sql: ${TABLE}.Date ;;
  }

  dimension: truck_owner_verification {
    type: number
    sql: ${TABLE}.Truck_Owner_Verification ;;
  }

  dimension: waiting_for_loading {
    type: number
    sql: ${TABLE}.Waiting_for_Loading ;;
  }

  dimension: truck_owner_verification_rejected {
    type: number
    sql: ${TABLE}.Truck_Owner_Verification_Rejected ;;
  }

  dimension: advance_doc_verification {
    type: number
    sql: ${TABLE}.Advance_DocVerification ;;
  }

  dimension: payment_pending {
    type: number
    sql: ${TABLE}.Payment_Pending ;;
  }

  dimension: advance_docs_rejected {
    type: number
    sql: ${TABLE}.Advance_Docs_Rejected ;;
  }

  dimension: settlement_doc_verification {
    type: number
    sql: ${TABLE}.Settlement_DocVerification ;;
  }

  dimension: settlement_pending {
    type: number
    sql: ${TABLE}.Settlement_Pending ;;
  }

  dimension: settlement_docs_rejected {
    type: number
    sql: ${TABLE}.Settlement_Docs_Rejected ;;
  }

}
