view: base_impserrorcode {
  sql_table_name: zinka.base_impserrorcode ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: action {
    type: number
    sql: ${TABLE}.action ;;
  }

  dimension: error_code {
    type: string
    sql: ${TABLE}.error_code ;;
  }

  dimension: error_description {
    type: string
    sql: ${TABLE}.error_description ;;
  }

  dimension: transaction_bank_id {
    type: number
    sql: ${TABLE}.transaction_bank_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
