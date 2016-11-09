view: base_notifications {
  sql_table_name: zinka.base_notifications ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: notification_msg {
    type: string
    sql: ${TABLE}.notification_msg ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: status_msg {
    type: string
    sql: ${TABLE}.status_msg ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
