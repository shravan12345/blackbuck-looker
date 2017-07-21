view: docsflowreport {
  derived_table: {
    sql: SELECT id, settlement_document_status from base_order where settlement_document_status in (2,3)
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: settlement_document_status {
    type: number
    sql: ${TABLE}.settlement_document_status ;;
  }

  set: detail {
    fields: [id, settlement_document_status]
  }
}
