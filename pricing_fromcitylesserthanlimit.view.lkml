view: pricing_fromcitylesserthanlimit {
  sql_table_name: zinka.pricing_fromcitylesserthanlimit ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: best_value_coefficient {
    type: number
    sql: ${TABLE}.best_value_coefficient ;;
  }

  dimension: location_id {
    type: number
    sql: ${TABLE}.location_id ;;
  }

  dimension: percentile_max_value_coefficient {
    type: number
    sql: ${TABLE}.percentile_max_value_coefficient ;;
  }

  dimension: percentile_min_value_coefficient {
    type: number
    sql: ${TABLE}.percentile_min_value_coefficient ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
