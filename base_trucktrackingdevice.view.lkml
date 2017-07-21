view: base_trucktrackingdevice {
  sql_table_name: zinka.base_trucktrackingdevice ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: created_by_id {
    type: number
    sql: ${TABLE}.created_by_id ;;
  }

  dimension_group: dt_added {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.dt_added ;;
  }

  dimension_group: dt_updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.dt_updated ;;
  }

  dimension_group: end {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.end_date ;;
  }

  dimension: is_timely_tracking {
    type: yesno
    sql: ${TABLE}.is_timely_tracking ;;
  }

  dimension: msisdn {
    type: string
    sql: ${TABLE}.msisdn ;;
  }

  dimension: push_operator_count {
    type: number
    sql: ${TABLE}.push_operator_count ;;
  }

  dimension: shipment {
    type: string
    sql: ${TABLE}.shipment ;;
  }

  dimension_group: start {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.start_date ;;
  }

  dimension: truck_id {
    type: number
    sql: ${TABLE}.truck_id ;;
  }

  dimension: vendor_type {
    type: number
    sql: ${TABLE}.vendor_type ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
