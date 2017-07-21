view: base_empanelledownerdocsmapping {
  sql_table_name: newbb.base_empanelledownerdocsmapping ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: docs_id {
    type: number
    sql: ${TABLE}.docs_id ;;
  }

  dimension: emp_owner_id {
    type: number
    sql: ${TABLE}.emp_owner_id ;;
  }

  dimension: is_verified {
    type: yesno
    sql: ${TABLE}.is_verified ;;
  }

  dimension: remarks {
    type: number
    sql: ${TABLE}.remarks ;;
  }

  dimension: verified_by_id {
    type: number
    sql: ${TABLE}.verified_by_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
