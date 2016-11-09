view: django_admin_log {
  sql_table_name: zinka.django_admin_log ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: action_flag {
    type: number
    sql: ${TABLE}.action_flag ;;
  }

  dimension_group: action {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.action_time ;;
  }

  dimension: change_message {
    type: string
    sql: ${TABLE}.change_message ;;
  }

  dimension: content_type_id {
    type: number
    sql: ${TABLE}.content_type_id ;;
  }

  dimension: object_id {
    type: string
    sql: ${TABLE}.object_id ;;
  }

  dimension: object_repr {
    type: string
    sql: ${TABLE}.object_repr ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
