view: docsflowreport_to_podteam {
  derived_table: {
    sql: select id, settlement_document_status from base_order where settlement_document_status = 2 or settlement_document_status = 3
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
