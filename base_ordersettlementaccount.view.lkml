view: base_ordersettlementaccount {
  sql_table_name: zinka.base_ordersettlementaccount ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
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

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: supply_partner_account_id {
    type: number
    sql: ${TABLE}.supply_partner_account_id ;;
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
