view: base_customermasterloadunload {
  sql_table_name: zinka.base_customermasterloadunload ;;

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

  dimension_group: last_updated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated_at ;;
  }

  dimension: last_updated_by_id {
    type: number
    sql: ${TABLE}.last_updated_by_id ;;
  }

  dimension: loading_charge {
    type: number
    sql: ${TABLE}.loading_charge ;;
  }

  dimension: loading_detention {
    type: number
    sql: ${TABLE}.loading_detention ;;
  }

  dimension: location_id {
    type: number
    sql: ${TABLE}.location_id ;;
  }

  dimension_group: start {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.start_time ;;
  }

  dimension: truck_type_id {
    type: number
    sql: ${TABLE}.truck_type_id ;;
  }

  dimension: unloading_charge {
    type: number
    sql: ${TABLE}.unloading_charge ;;
  }

  dimension: unloading_detention {
    type: number
    sql: ${TABLE}.unloading_detention ;;
  }

  dimension: warehouse_id {
    type: number
    sql: ${TABLE}.warehouse_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
