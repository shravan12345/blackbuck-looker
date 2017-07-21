view: base_bankaccount {
  sql_table_name: newbb.base_bankaccount ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: beneficiary_acc_num {
    type: string
    sql: ${TABLE}.beneficiary_acc_num ;;
  }

  dimension: beneficiary_ifsc {
    type: string
    sql: ${TABLE}.beneficiary_ifsc ;;
  }

  dimension: beneficiary_name {
    type: string
    sql: ${TABLE}.beneficiary_name ;;
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

  dimension: state {
    type: number
    sql: ${TABLE}.state ;;
  }

  dimension: updated_by_id {
    type: number
    sql: ${TABLE}.updated_by_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, beneficiary_name]
  }
}
