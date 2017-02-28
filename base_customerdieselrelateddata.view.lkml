view: base_customerdieselrelateddata {
  sql_table_name: zinka.base_customerdieselrelateddata ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: additional_rate_change_type {
    type: number
    sql: ${TABLE}.additional_rate_change_type ;;
  }

  dimension: cities {
    type: string
    sql: ${TABLE}.cities ;;
  }

  dimension_group: created {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at ;;
  }

  dimension: created_by_id {
    type: number
    sql: ${TABLE}.created_by_id ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: fuel_percentage_change_threshold {
    type: number
    sql: ${TABLE}.fuel_percentage_change_threshold ;;
  }

  dimension: fuel_price_change_threshold {
    type: number
    sql: ${TABLE}.fuel_price_change_threshold ;;
  }

  dimension: rate_change_multiplier {
    type: number
    sql: ${TABLE}.rate_change_multiplier ;;
  }

  dimension: rate_change_trigger_type {
    type: number
    sql: ${TABLE}.rate_change_trigger_type ;;
  }

  dimension: rate_change_type {
    type: number
    sql: ${TABLE}.rate_change_type ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at ;;
  }

  dimension: updated_by_id {
    type: number
    sql: ${TABLE}.updated_by_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
