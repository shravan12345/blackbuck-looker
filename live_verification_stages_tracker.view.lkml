view: live_verification_stages_tracker {
  derived_table: {
    sql: select distinct
      bo.id as 'GB_Order_Id',
      adv.dt_added as 'Advance DocVerification',
      pp.dt_added as 'Payment Pending',
      adr.dt_added as 'Advance Docs Rejected',
      sdv.dt_added as 'Settlement DocVerification',
      sp.dt_added as 'Settlement Pending',
      sdr.dt_added as 'Settlement Docs Rejected',
      tov.dt_added as 'Truck Owner Verification',
      wfl.dt_added as 'Waiting for Loading',
      tovr.dt_added as 'Truck Owner Verification Rejected'
      from base_order bo
      left join base_status adv on adv.order_id = bo.id and adv.status = 'Advance DocVerification'
      left join base_status pp on pp.order_id = bo.id and pp.status = 'Payment Pending'
      left join base_status adr on adr.order_id = bo.id and adr.status = 'Advance Docs Rejected'
      left join base_status sdv on sdv.order_id = bo.id and sdv.status = 'Settlement DocVerification'
      left join base_status sp on sp.order_id = bo.id and sp.status = 'Settlement Pending'
      left join base_status sdr on sdr.order_id = bo.id and sdr.status = 'Settlement Docs Rejected'
      left join base_status tov on tov.order_id = bo.id and tov.status = 'Truck Owner Verification'
      left join base_status wfl on wfl.order_id = bo.id and wfl.status = 'Waiting for Loading'
      left join base_status tovr on tovr.order_id = bo.id and tovr.status = 'Truck Owner Verification Rejected'
      left join base_location blf on blf.id = bo.from_city_id
      where (date(adv.dt_added) = current_date() or date(sdv.dt_added) = current_date() or date(tov.dt_added) = current_date())
       ;;
  }

  dimension: gb_order_id {
    type: string
    sql: ${TABLE}.GB_Order_Id ;;
  }

  dimension_group: advance_doc_verification {
    type: time
    label: "Advance DocVerification"
    sql: ${TABLE}.`Advance DocVerification` ;;
  }

  dimension_group: payment_pending {
    type: time
    label: "Payment Pending"
    sql: ${TABLE}.`Payment Pending` ;;
  }

  dimension_group: advance_docs_rejected {
    type: time
    label: "Advance Docs Rejected"
    sql: ${TABLE}.`Advance Docs Rejected` ;;
  }

  dimension_group: settlement_doc_verification {
    type: time
    label: "Settlement DocVerification"
    sql: ${TABLE}.`Settlement DocVerification` ;;
  }

  dimension_group: settlement_pending {
    type: time
    label: "Settlement Pending"
    sql: ${TABLE}.`Settlement Pending` ;;
  }

  dimension_group: settlement_docs_rejected {
    type: time
    label: "Settlement Docs Rejected"
    sql: ${TABLE}.`Settlement Docs Rejected` ;;
  }

  dimension_group: truck_owner_verification {
    type: time
    label: "Truck Owner Verification"
    sql: ${TABLE}.`Truck Owner Verification` ;;
  }

  dimension_group: waiting_for_loading {
    type: time
    label: "Waiting for Loading"
    sql: ${TABLE}.`Waiting for Loading` ;;
  }

  dimension_group: truck_owner_verification_rejected {
    type: time
    label: "Truck Owner Verification Rejected"
    sql: ${TABLE}.`Truck Owner Verification Rejected` ;;
  }

}
