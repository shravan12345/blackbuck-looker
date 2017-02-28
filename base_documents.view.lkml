view: base_documents {
  sql_table_name: newbb.base_documents ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: doc_description {
    type: string
    sql: ${TABLE}.doc_description ;;
  }

  dimension: doc_text {
    type: string
    sql: ${TABLE}.doc_text ;;
  }

  dimension: doc_type {
    type: number
    sql: ${TABLE}.doc_type ;;
  }

  dimension: doc_url {
    type: string
    sql: ${TABLE}.doc_url ;;
  }

  dimension_group: dt_added {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.dt_added ;;
  }

  dimension_group: dt_updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.dt_updated ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active ;;
  }

  dimension: updated_by_id {
    type: number
    sql: ${TABLE}.updated_by_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
