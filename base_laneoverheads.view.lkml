view: base_laneoverheads {
  sql_table_name: zinka.base_laneoverheads ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension_group: end {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.end_time ;;
  }

  dimension: from_city_id {
    type: number
    sql: ${TABLE}.from_city_id ;;
  }

  dimension: from_warehouse_id {
    type: number
    sql: ${TABLE}.from_warehouse_id ;;
  }

  dimension: halt_charges_per_day {
    type: number
    sql: ${TABLE}.halt_charges_per_day ;;
  }

  dimension: lane_id {
    type: number
    sql: ${TABLE}.lane_id ;;
  }

  dimension: loading_charge {
    type: number
    sql: ${TABLE}.loading_charge ;;
  }

  dimension: max_weight {
    type: number
    sql: ${TABLE}.max_weight ;;
  }

  dimension: min_weight {
    type: number
    sql: ${TABLE}.min_weight ;;
  }

  dimension: rate {
    type: number
    sql: ${TABLE}.rate ;;
  }

  dimension_group: start {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.start_time ;;
  }

  dimension: to_city_id {
    type: number
    sql: ${TABLE}.to_city_id ;;
  }

  dimension: to_warehouse_id {
    type: number
    sql: ${TABLE}.to_warehouse_id ;;
  }

  dimension: truck_type_id {
    type: number
    sql: ${TABLE}.truck_type_id ;;
  }

  dimension: unloading_charge {
    type: number
    sql: ${TABLE}.unloading_charge ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
