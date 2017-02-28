view: base_uservalidation {
  sql_table_name: newbb.base_uservalidation ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: client_type {
    type: number
    sql: ${TABLE}.client_type ;;
  }

  dimension: on_boarding_status {
    type: string
    sql: ${TABLE}.on_boarding_status ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
  }

  dimension: updated_by_id {
    type: number
    sql: ${TABLE}.updated_by_id ;;
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
