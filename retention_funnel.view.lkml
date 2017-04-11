view: retention_funnel {
  derived_table: {
    sql: SELECT CAST(@rownum := @rownum + 1 AS UNSIGNED) AS prim_key, x.* FROM(SELECT a.supply_partner_id, MONTH( MIN( a.end_date ) ) as first_order_month, data.order_month as order_month, data.number_of_orders
 AS number_of_orders,if(EXTRACT(MONTH FROM NOW())>MONTH(MIN(a.end_date)),EXTRACT(MONTH FROM NOW()) - MONTH(MIN(a.end_date)),12+EXTRACT(MONTH FROM NOW()) - MONTH(MIN(a.end_date))) as total_users FROM base_order AS a
LEFT JOIN (

SELECT a.supply_partner_id AS sp_id, MONTH( a.end_date ) AS order_month, COUNT( a.id ) AS number_of_orders
FROM base_order AS a
WHERE a.supply_partner_id IS NOT NULL
AND a.end_date > DATE( NOW( ) ) - INTERVAL 120
DAY GROUP BY 1 , 2
) AS data ON a.supply_partner_id = data.sp_id
WHERE a.end_date > DATE( NOW( ) ) - INTERVAL 120
DAY AND a.supply_partner_id IS NOT NULL
GROUP BY 1 , 3
ORDER BY  `a`.`supply_partner_id` ASC)  as x, (SELECT @rownum := 0) r ;;
    sql_trigger_value: SELECT CURDATE() ;;
    indexes: ["prim_key"]
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.supply_partner_id ;;
  }
  dimension: first_order_month {
    type: number
    sql: ${TABLE}.first_order_month ;;


  }
  dimension: order_month {
    type: number
    sql: ${TABLE}.order_month ;;
  }
  measure: total_users {
    type: sum
    sql: ${TABLE}.total_users  ;;
  }
  dimension: total_orders {
    type: number
    sql: ${TABLE}.number_of_orders ;;
  }

  dimension: number_of_active_months {
    type: number
    sql: if(${TABLE}.first_order_month<=${TABLE}.order_month,${TABLE}.order_month - ${TABLE}.first_order_month,12+${TABLE}.order_month - ${TABLE}.first_order_month) ;;
  }


  measure: total_active_users {
    type: count_distinct
    sql: ${TABLE}.supply_partner_id ;;

  filters: {
    field: total_orders
    value: ">=1"
  }

  }
  measure: percent_of_cohort_active {
    type: number
    value_format_name: percent_1
    sql: 1.0 * ${total_active_users} / nullif(${total_users},0) ;;
  }

}
