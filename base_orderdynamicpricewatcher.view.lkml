view: base_orderdynamicpricewatcher {
  sql_table_name: zinka.base_orderdynamicpricewatcher ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: alarm_current_price {
    type: number
    sql: ${TABLE}.alarm_current_price ;;
  }

  dimension: alarm_price {
    type: number
    sql: ${TABLE}.alarm_price ;;
  }

  dimension: auto_watch {
    type: yesno
    sql: ${TABLE}.auto_watch ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: is_watch {
    type: yesno
    sql: ${TABLE}.is_watch ;;
  }

  dimension_group: last_watch {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_watch_time ;;
  }

  dimension: order_dynamic_price_id {
    type: number
    sql: ${TABLE}.order_dynamic_price_id ;;
  }

  dimension_group: watch_start {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.watch_start_time ;;
  }

  measure: count_alarm {
    type: sum
    sql: CASE WHEN ${alarm_price} IS NOT NULL THEN 1 ELSE 0 END ;;
    drill_fields: [id]
  }
  measure: count_likes_sp {
    type: count_distinct
    sql: ${customer_id} ;;
  }
  measure: count_alarm_sp {
    type: count_distinct
    sql: CASE WHEN ${is_watch} = 0 and ${alarm_price} is not null THEN ${customer_id} ELSE NULL END ;;
  }
}
