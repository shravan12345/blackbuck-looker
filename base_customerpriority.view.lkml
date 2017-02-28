view: base_customerpriority {
  sql_table_name: zinka.base_customerpriority ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: priority {
    type: number
    sql: ${TABLE}.priority ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
