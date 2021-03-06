view: base_userinfo {
  sql_table_name: zinka.base_userinfo ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: id_number {
    type: string
    sql: ${TABLE}.id_number ;;
  }

  dimension: id_type {
    type: string
    sql: ${TABLE}.id_type ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
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
