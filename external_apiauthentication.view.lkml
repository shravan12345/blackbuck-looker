view: external_apiauthentication {
  sql_table_name: zinka.external_apiauthentication ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: api_key {
    type: string
    sql: ${TABLE}.api_key ;;
  }

  dimension: customer_name {
    type: string
    sql: ${TABLE}.customer_name ;;
  }

  measure: count {
    type: count
    drill_fields: [id, customer_name]
  }
}
