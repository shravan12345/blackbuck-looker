view: base_latestlocation {
  sql_table_name: zinka.base_latestlocation ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: accuracy {
    type: number
    sql: ${TABLE}.accuracy ;;
  }

  dimension: battery_level {
    type: number
    sql: ${TABLE}.batteryLevel ;;
  }

  dimension: battery_status {
    type: number
    sql: ${TABLE}.batteryStatus ;;
  }

  dimension: data_obtained {
    type: string
    sql: ${TABLE}.data_obtained ;;
  }

  dimension_group: dt_added {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_added ;;
  }

  dimension_group: dt_updated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_updated ;;
  }

  dimension: gps_status {
    type: yesno
    sql: ${TABLE}.gps_status ;;
  }

  dimension: housekeeping_data {
    type: string
    sql: ${TABLE}.housekeeping_data ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: truck_id {
    type: number
    sql: ${TABLE}.truck_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
