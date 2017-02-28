view: base_warehouselane_tolls {
  sql_table_name: zinka.base_warehouselane_tolls ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: tolldetails_id {
    type: number
    sql: ${TABLE}.tolldetails_id ;;
  }

  dimension: warehouselane_id {
    type: number
    sql: ${TABLE}.warehouselane_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
