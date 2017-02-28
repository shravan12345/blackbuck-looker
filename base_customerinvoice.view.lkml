view: base_customerinvoice {
  sql_table_name: zinka.base_customerinvoice ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: courier_number {
    type: string
    sql: ${TABLE}.courier_number ;;
  }

  dimension: courier_service_id {
    type: number
    sql: ${TABLE}.courier_service_id ;;
  }

  dimension_group: date_added {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date_added ;;
  }

  dimension: deleted_by_id {
    type: number
    sql: ${TABLE}.deleted_by_id ;;
  }

  dimension: freight_bill_number {
    type: string
    sql: ${TABLE}.freight_bill_number ;;
  }

  dimension: inv_generated_by_id {
    type: number
    sql: ${TABLE}.inv_generated_by_id ;;
  }

  dimension_group: inv_generation {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.inv_generation_date ;;
  }

  dimension_group: invoice {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.invoice_date ;;
  }

  dimension: invoice_number {
    type: string
    sql: ${TABLE}.invoice_number ;;
  }

  dimension: invoice_status {
    type: number
    sql: ${TABLE}.invoice_status ;;
  }

  dimension: invoice_url {
    type: string
    sql: ${TABLE}.invoice_url ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: last_modified_by_id {
    type: number
    sql: ${TABLE}.last_modified_by_id ;;
  }

  dimension_group: last_modified {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension: latest_rejection_reason_id {
    type: number
    sql: ${TABLE}.latest_rejection_reason_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
