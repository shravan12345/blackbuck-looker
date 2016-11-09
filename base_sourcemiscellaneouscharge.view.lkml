view: base_sourcemiscellaneouscharge {
  sql_table_name: zinka.base_sourcemiscellaneouscharge ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: charge {
    type: number
    sql: ${TABLE}.charge ;;
  }

  dimension: order_finance_details_id {
    type: number
    sql: ${TABLE}.order_finance_details_id ;;
  }

  dimension: type_of_charge {
    type: number
    sql: ${TABLE}.type_of_charge ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
