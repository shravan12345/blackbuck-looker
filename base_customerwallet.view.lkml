view: base_customerwallet {
  sql_table_name: zinka.base_customerwallet ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: balance {
    type: number
    sql: ${TABLE}.balance ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
