view: pricing_corprfqenquires {
  sql_table_name: zinka.pricing_corprfqenquires ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: approved {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.approved_at ;;
  }

  dimension: approved_by_id {
    type: number
    sql: ${TABLE}.approved_by_id ;;
  }

  dimension: approved_file {
    type: string
    sql: ${TABLE}.approved_file ;;
  }

  dimension: enquired_by_id {
    type: number
    sql: ${TABLE}.enquired_by_id ;;
  }

  dimension: enquiry_file {
    type: string
    sql: ${TABLE}.enquiry_file ;;
  }

  dimension_group: enquiry {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.enquiry_time ;;
  }

  dimension: prices_file {
    type: string
    sql: ${TABLE}.prices_file ;;
  }

  dimension: pricing_uploaded_file {
    type: string
    sql: ${TABLE}.pricing_uploaded_file ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
