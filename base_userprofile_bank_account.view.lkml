view: base_userprofile_bank_account {
  sql_table_name: newbb.base_userprofile_bank_account ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: bankaccount_id {
    type: number
    sql: ${TABLE}.bankaccount_id ;;
  }

  dimension: userprofile_id {
    type: number
    sql: ${TABLE}.userprofile_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
