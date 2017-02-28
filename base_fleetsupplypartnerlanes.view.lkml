view: base_fleetsupplypartnerlanes {
  sql_table_name: zinka.base_fleetsupplypartnerlanes ;;

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

  dimension_group: last_updated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated_at ;;
  }

  dimension: last_updated_by_id {
    type: number
    sql: ${TABLE}.last_updated_by_id ;;
  }

  dimension_group: start {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.start_time ;;
  }

  dimension: supply_partner_id {
    type: number
    sql: ${TABLE}.supply_partner_id ;;
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

  measure: count {
    type: count
    drill_fields: [id]
  }
}
