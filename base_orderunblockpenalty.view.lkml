view: base_orderunblockpenalty {
  sql_table_name: zinka.base_orderunblockpenalty ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: accepted {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.accepted_time ;;
  }

  dimension: action_taken {
    type: string
    sql: ${TABLE}.action_taken ;;
  }

  dimension: amount_paid_status {
    type: number
    sql: ${TABLE}.amount_paid_status ;;
  }

  dimension_group: dt_added {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_added ;;
  }

  dimension_group: dt_updated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_updated ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: penalty_amount_actual {
    type: number
    sql: ${TABLE}.penalty_amount_actual ;;
  }

  dimension: penalty_amount_suggested {
    type: number
    sql: ${TABLE}.penalty_amount_suggested ;;
  }

  dimension: state {
    type: number
    sql: ${TABLE}.state ;;
  }

  dimension: supply_partner_account_id {
    type: number
    sql: ${TABLE}.supply_partner_account_id ;;
  }

  dimension: supply_partner_id {
    type: number
    sql: ${TABLE}.supply_partner_id ;;
  }

  dimension: truck_type_id {
    type: number
    sql: ${TABLE}.truck_type_id ;;
  }

  dimension: unblock_by_id {
    type: number
    sql: ${TABLE}.unblock_by_id ;;
  }

  dimension_group: unblocked {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.unblocked_time ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
