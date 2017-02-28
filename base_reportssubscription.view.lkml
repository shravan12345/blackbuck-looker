view: base_reportssubscription {
  sql_table_name: zinka.base_reportssubscription ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: group_mail {
    type: string
    sql: ${TABLE}.group_mail ;;
  }

  dimension: report_name {
    type: string
    sql: ${TABLE}.report_name ;;
  }

  measure: count {
    type: count
    drill_fields: [id, report_name]
  }
}
