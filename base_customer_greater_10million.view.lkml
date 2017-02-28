view: base_customer_greater_10million {
  derived_table: {
    sql: SELECT CAST(@rownum := @rownum + 1 AS UNSIGNED) AS prim_key, x.* FROM (Select a.user_id,a.short_name , sum(b.total_revenue) as total_month_revenue from base_order as c left join base_orderprofitability as b on b.order_id = c.id left join base_customeruserprofile as a on a.user_id = c.user_id where  (c.end_date > (DATE(NOW()) - INTERVAL (EXTRACT( DAY FROM NOW())) DAY) and c.end_date < DATE(NOW())) group by 1,2) as x,(SELECT @rownum := 0) r ;;
    sql_trigger_value: SELECT CURDATE() ;;
    indexes: ["prim_key"]
  }

  dimension: customer_user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: customer_name {
    type: string
    sql: ${TABLE}.short_name ;;
  }

  dimension: total_month_revenue {
    type: number
    sql: ${TABLE}.total_month_revenue ;;
  }

  measure: count_over_onecr {
    type: sum
    sql: CASE WHEN (${TABLE}.total_month_revenue > 10000000) THEN 1 ELSE 0 END ;;
  }

  dimension: prim_key {
    type: number
    primary_key: yes
    sql: ${TABLE}.prim_key ;;
  }
}

#   -
