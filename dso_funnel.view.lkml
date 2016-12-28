view: dso_funnel {
  derived_table: {
    sql: Select a.user_id ,d.name as Customer_name, sum(a.order_value) as total_business , c.payment , sum(a.order_value)/e.number_days  as daily_business_value from base_order as a left join ( Select b.customer_id , sum(b.amount) as payment from base_receivablepayment as b group by 1) c  on a.user_id = c.customer_id left join
          base_customeruserprofile as d  ON d.user_id = a.user_id left join (SELECT a.user_id, TIMESTAMPDIFF(
day , MIN( a.end_Date ) , MAX( a.end_date ) ) as number_days
FROM base_order AS a
GROUP BY 1 ) e ON e.user_id = a.user_id group by 1 ,2 ;;
    sql_trigger_value: SELECT CURDATE() ;;
    indexes: ["user_id"]
  }

dimension: Customer_id {
  type: number
  sql: ${TABLE}.user_id ;;
  }

dimension: Customer_name {
  type: string
  sql: ${TABLE}.Customer_name ;;
}
dimension: Total_business_value{
  type: number
  sql: ${TABLE}.total_business ;;
}
dimension: Total_receivables
{
  type: number
  sql: ${TABLE}.payment ;;
}
dimension: Difference_value {
  type: number
  sql: ${Total_business_value}-${Total_receivables} ;;
}
dimension: Daily_business {
  type: number
  sql: ${TABLE}.daily_business_value ;;
}

}
