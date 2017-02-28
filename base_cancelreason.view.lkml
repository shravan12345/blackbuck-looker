view: base_cancelreason {
  sql_table_name: zinka.base_cancelreason ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: mark_by_customer {
    type: yesno
    sql: ${TABLE}.mark_by_customer ;;
  }

  dimension: reason {
    type: string
    sql: ${TABLE}.reason ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
