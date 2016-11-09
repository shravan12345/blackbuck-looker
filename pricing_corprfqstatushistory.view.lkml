view: pricing_corprfqstatushistory {
  sql_table_name: zinka.pricing_corprfqstatushistory ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: enquiry_id {
    type: number
    sql: ${TABLE}.enquiry_id ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
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
