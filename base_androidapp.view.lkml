view: base_androidapp {
  sql_table_name: zinka.base_androidapp ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: app_config {
    type: string
    sql: ${TABLE}.app_config ;;
  }

  dimension: client_type {
    type: number
    sql: ${TABLE}.client_type ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
