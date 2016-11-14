view: base_ordereta {
  sql_table_name: zinka.base_ordereta ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: dt_added {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_added ;;
  }

  dimension_group: eta {
    type: time
    timeframes: [time, date, week, month, raw]
    sql: ${TABLE}.eta ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  measure: count {
    type: count
    drill_fields: [order_id, eta_raw,  TAD.dt_updated, base_order.status]
  }

  dimension: deviation {
    type: tier
    tiers: [0, 24, 48, 72]
    sql: TIMESTAMPDIFF(hour,${eta_raw},${base_orderetahistory.latest_date}) ;;
  }

  dimension: deviation_transit {
    type: number
    sql: IF( TIMESTAMPDIFF(hour,${eta_raw},${eta_revised_view.revised_eta_raw}) IS NOT NULL ,TIMESTAMPDIFF(hour,${eta_raw},${eta_revised_view.revised_eta_raw}),null) ;;
    value_format_name: decimal_0
  }

  dimension: truck_in_transit_deviation {
    type: tier
    tiers: [0, 24, 48, 72]
    sql: ${deviation_transit} ;;
  }

  dimension: transit_count {
    case: {
      when: {
        sql: TIMESTAMPDIFF(hour,${TAD.dt_updated_raw},${eta_raw}) >= 0 OR ${base_order.status} = "Truck Departure Destination" OR "Truck Unloading" ;;
        label: "IN-TIME"
      }

      when: {
        sql: TIMESTAMPDIFF(hour,${TAD.dt_updated_raw},${eta_raw}) <= 0 OR ( ${base_order.status} = "Truck In-Transit" and TIMESTAMPDIFF(hour,${eta_revised_view.location_update_time_raw},${eta_raw}) <= 24 and TIMESTAMPDIFF(hour,${eta_revised_view.revised_eta_raw},${eta_raw}) > 0) ;;
        label: "Delayed"
      }

      when: {
        sql: ${base_order.status} = "Truck In-Transit" ;;
        label: "Not Known"
      }
    }
  }
}
