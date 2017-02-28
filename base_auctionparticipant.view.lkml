view: base_auctionparticipant {
  sql_table_name: zinka.base_auctionparticipant ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: auction_id {
    type: number
    sql: ${TABLE}.auction_id ;;
  }

  dimension: truck_id {
    type: number
    sql: ${TABLE}.truck_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
