view: base_trucktypepenaltymap {
  sql_table_name: zinka.base_trucktypepenaltymap ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: default_penalty {
    type: number
    sql: ${TABLE}.default_penalty ;;
  }

  dimension: delay_penalty {
    type: number
    sql: ${TABLE}.delay_penalty ;;
  }

  dimension_group: dt_added {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.dt_added ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active ;;
  }

  dimension: truck_type_id {
    type: number
    sql: ${TABLE}.truck_type_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
