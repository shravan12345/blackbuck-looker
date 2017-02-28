view: base_supplyassociatedoes {
  sql_table_name: zinka.base_supplyassociatedoes ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: associted_oe_id {
    type: number
    sql: ${TABLE}.associted_OE_id ;;
  }

  dimension: supply_partner_id {
    type: number
    sql: ${TABLE}.supply_partner_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
