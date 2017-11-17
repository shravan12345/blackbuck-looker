view: kandla_verification_stages_data {
  derived_table: {
    sql: select distinct
      bo.id as 'GB_Order_Id',
      tcv.dt_added as 'Truck Checklist Verified Timestamp',
      tov.dt_added as 'Truck Owner Verification Timestamp',
      wfv.dt_added as 'Waiting For Loading Timestamp',
      adv.dt_added as 'Advance DocVerification Timestamp',
      autcv.username as 'Truck Checklist Verified Employee',
      autov.username as 'Truck Owner Verification Employee',
      auwfv.username as 'Waiting For Loading Employee',
      auadv.username as 'Advance DocVerification Employee'
      from base_order bo
      join newbb.enquiry_order eo on eo.id = bo.client_handshake_order_id
      left join base_status tcv on tcv.order_id = bo.id and tcv.status = 'Truck Checklist Verified'
      left join base_status tov on tov.order_id = bo.id and tov.status = 'Truck Owner Verification'
      left join base_status wfv on wfv.order_id = bo.id and wfv.status = 'Waiting For Loading'
      left join base_status tas on tas.order_id = bo.id and tas.status = 'Truck Arrival Source'
      left join base_status adv on adv.order_id = bo.id and adv.status = 'Advance DocVerification'
      left join base_location blf on blf.id = bo.from_city_id
      left join auth_user autcv on autcv.id = tcv.last_modified_by_id
      left join auth_user autov on autov.id = tov.last_modified_by_id
      left join auth_user auwfv on auwfv.id = wfv.last_modified_by_id
      left join auth_user auadv on auadv.id = adv.last_modified_by_id
      where blf.city in ('Anjar','Bhuj','Mundra')
       ;;
  }



  dimension: gb_order_id {
    type: number
    sql: ${TABLE}.GB_Order_Id ;;
  }

  dimension_group: truck_checklist_verified_timestamp {
    type: time
    timeframes: [time, date, week, month, hour, hour_of_day, raw, day_of_week]
    label: "Truck Checklist Verified Timestamp"
    sql: ${TABLE}.`Truck Checklist Verified Timestamp` ;;
  }

  dimension_group: truck_owner_verification_timestamp {
    type: time
    timeframes: [time, date, week, month, hour, hour_of_day, raw, day_of_week]
    label: "Truck Owner Verification Timestamp"
    sql: ${TABLE}.`Truck Owner Verification Timestamp` ;;
  }

  dimension_group: waiting_for_loading_timestamp {
    type: time
    timeframes: [time, date, week, month, hour, hour_of_day, raw, day_of_week]
    label: "Waiting For Loading Timestamp"
    sql: ${TABLE}.`Waiting For Loading Timestamp` ;;
  }

  dimension_group: advance_doc_verification_timestamp {
    type: time
    timeframes: [time, date, week, month, hour, hour_of_day, raw, day_of_week]
    label: "Advance DocVerification Timestamp"
    sql: ${TABLE}.`Advance DocVerification Timestamp` ;;
  }

  dimension: truck_checklist_verified_employee {
    type: string
    label: "Truck Checklist Verified Employee"
    sql: ${TABLE}.`Truck Checklist Verified Employee` ;;
  }

  dimension: truck_owner_verification_employee {
    type: string
    label: "Truck Owner Verification Employee"
    sql: ${TABLE}.`Truck Owner Verification Employee` ;;
  }

  dimension: waiting_for_loading_employee {
    type: string
    label: "Waiting For Loading Employee"
    sql: ${TABLE}.`Waiting For Loading Employee` ;;
  }

  dimension: advance_doc_verification_employee {
    type: string
    label: "Advance DocVerification Employee"
    sql: ${TABLE}.`Advance DocVerification Employee` ;;
  }


}
