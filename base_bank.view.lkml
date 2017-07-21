view: base_bank {

  sql_table_name: zinka.base_bank ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
}

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
