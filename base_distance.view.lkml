view: base_distance {
  sql_table_name: zinka.base_distance ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: distance {
    type: number
    sql: ${TABLE}.distance ;;
  }

  dimension: from_latitude {
    type: number
    sql: ${TABLE}.from_latitude ;;
  }

  dimension: from_longitude {
    type: number
    sql: ${TABLE}.from_longitude ;;
  }

  dimension: to_latitude {
    type: number
    sql: ${TABLE}.to_latitude ;;
  }

  dimension: to_longitude {
    type: number
    sql: ${TABLE}.to_longitude ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
