view: base_languagesremapping {
  sql_table_name: zinka.base_languagesremapping ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: language_id {
    type: number
    sql: ${TABLE}.language_id ;;
  }

  dimension: sre_id {
    type: number
    sql: ${TABLE}.sre_id ;;
  }

  dimension: sre_ranking {
    type: number
    sql: ${TABLE}.sre_ranking ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
