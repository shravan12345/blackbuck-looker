view: base_ordercreationinfo {
  sql_table_name: zinka.base_ordercreationinfo ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: source {
    type: number
    sql: ${TABLE}.source ;;
  }

  dimension: source_email {
    type: string
    sql: ${TABLE}.source_email ;;
  }

  dimension_group: source_email {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.source_email_date ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
