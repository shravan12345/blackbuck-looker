view: base_trucklocation {
  sql_table_name: zinka.base_trucklocation ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: accuracy {
    type: number
    sql: ${TABLE}.accuracy ;;
  }

  dimension: bearing {
    type: number
    sql: ${TABLE}.bearing ;;
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

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: provider {
    type: string
    sql: ${TABLE}.provider ;;
  }

  dimension: speed {
    type: number
    sql: ${TABLE}.speed ;;
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
