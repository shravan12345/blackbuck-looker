view: base_tolldetails_toll_charges {
  sql_table_name: zinka.base_tolldetails_toll_charges ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: tolldetails_id {
    type: number
    sql: ${TABLE}.tolldetails_id ;;
  }

  dimension: tollrate_id {
    type: number
    sql: ${TABLE}.tollrate_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
