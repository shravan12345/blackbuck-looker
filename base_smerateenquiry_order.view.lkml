view: base_smerateenquiry_order {
  sql_table_name: zinka.base_smerateenquiry_order ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: smerateenquiry_id {
    type: number
    sql: ${TABLE}.smerateenquiry_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
