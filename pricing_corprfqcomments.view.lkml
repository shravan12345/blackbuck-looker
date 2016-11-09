view: pricing_corprfqcomments {
  sql_table_name: zinka.pricing_corprfqcomments ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: comment {
    type: string
    sql: ${TABLE}.comment ;;
  }

  dimension: comment_by_id {
    type: number
    sql: ${TABLE}.comment_by_id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at ;;
  }

  dimension: rfq_id {
    type: number
    sql: ${TABLE}.rfq_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
