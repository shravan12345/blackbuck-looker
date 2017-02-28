view: base_manualorderrevenue {
  sql_table_name: zinka.base_manualorderrevenue ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: checkpost_charges {
    type: number
    sql: ${TABLE}.checkpost_charges ;;
  }

  dimension: freight_amount {
    type: number
    sql: ${TABLE}.freight_amount ;;
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

  dimension: loading_charge {
    type: number
    sql: ${TABLE}.loading_charge ;;
  }

  dimension: loading_detention {
    type: number
    sql: ${TABLE}.loading_detention ;;
  }

  dimension: multiple_loading_pt_charge {
    type: number
    sql: ${TABLE}.multiple_loading_pt_charge ;;
  }

  dimension: multiple_unloading_pt_charge {
    type: number
    sql: ${TABLE}.multiple_unloading_pt_charge ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: other_misc_charges {
    type: number
    sql: ${TABLE}.other_misc_charges ;;
  }

  dimension: plywood_charges {
    type: number
    sql: ${TABLE}.plywood_charges ;;
  }

  dimension: unloading_charge {
    type: number
    sql: ${TABLE}.unloading_charge ;;
  }

  dimension: unloading_detention {
    type: number
    sql: ${TABLE}.unloading_detention ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
