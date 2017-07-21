view: pod_penalty_settlement_done {
  derived_table: {
    sql: SELECT bof.order_id, bof.lr_number, bs.status, bof.Penalty, bof.POD_Penalty, bof.transit_time_penalty
      FROM `base_orderfinancedetails` bof
      INNER JOIN base_status bs ON bof.order_id = bs.order_id
      AND bs.status = 'Settlement Done'
      AND bof.penalty >0
      ORDER BY bof.order_id DESC
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: lr_number {
    type: string
    sql: ${TABLE}.lr_number ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: penalty {
    type: number
    sql: ${TABLE}.Penalty ;;
  }

  dimension: pod_penalty {
    type: number
    sql: ${TABLE}.POD_Penalty ;;
  }

  dimension: transit_time_penalty {
    type: number
    sql: ${TABLE}.transit_time_penalty ;;
  }

  set: detail {
    fields: [
      order_id,
      lr_number,
      status,
      penalty,
      pod_penalty,
      transit_time_penalty
    ]
  }
}
