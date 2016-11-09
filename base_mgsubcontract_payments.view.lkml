view: base_mgsubcontract_payments {
  sql_table_name: zinka.base_mgsubcontract_payments ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: financialtransaction_id {
    type: number
    sql: ${TABLE}.financialtransaction_id ;;
  }

  dimension: mgsubcontract_id {
    type: number
    sql: ${TABLE}.mgsubcontract_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
