view: base_multipleloadingpoint {
  sql_table_name: zinka.base_multipleloadingpoint ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: last_modified_by_id {
    type: number
    sql: ${TABLE}.last_modified_by_id ;;
  }

  dimension_group: last_modified {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension: loading_point_warehouse_id {
    type: number
    sql: ${TABLE}.loading_point_warehouse_id ;;
  }

  dimension: lr_number {
    type: string
    sql: ${TABLE}.lr_number ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
