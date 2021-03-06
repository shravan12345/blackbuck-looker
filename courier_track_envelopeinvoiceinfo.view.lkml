view: courier_track_envelopeinvoiceinfo {
  sql_table_name: zinka.courierTrack_envelopeinvoiceinfo ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: envelope_id {
    type: number
    sql: ${TABLE}.envelope_id ;;
  }

  dimension: invoice_id {
    type: number
    sql: ${TABLE}.invoice_id ;;
  }

  dimension: is_cancelled {
    type: yesno
    sql: ${TABLE}.is_cancelled ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
