view: eta_revised_view {
  derived_table: {
    sql: SELECT ETA1.order_id,ETA1.revised_eta,ETA1.location_update_time FROM base_orderetahistory as ETA1 where ETA1.revised_eta = ( Select MAX(revised_eta) from base_orderetahistory ETA2 where ETA1.order_id = ETA2.order_id) ;;
    sql_trigger_value: SELECT CURDATE() ;;
    indexes: ["order_id"]
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: revised_eta {
    type: time
    timeframes: [time, date, week, month, hour, hour_of_day, raw, day_of_week]
    sql: ${TABLE}.revised_eta ;;
  }

  dimension_group: location_update_time {
    type: time
    timeframes: [time, date, week, month, hour, hour_of_day, raw, day_of_week]
    sql: ${TABLE}.location_update_time ;;
  }

  measure: count {
    type: count
  }
}
