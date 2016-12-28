view: dso_funnel {
  derived_table: {
    sql: Select a.user_id ,d.name as Customer_name, sum(a.order_value) as total_business , c.payment , e.daily_business_value  as daily_business_value from base_order as a left join ( Select b.customer_id , sum(b.amount) as payment from base_receivablepayment as b group by 1) c  on a.user_id = c.customer_id left join
          base_customeruserprofile as d  ON d.user_id = a.user_id left join (SELECT a.user_id , b.short_name , sum(a.order_value)/90 as daily_business_value from base_order as a left join base_customeruserprofile as b on a.user_id = b.user_id where a.end_date > (DATE(NOW()) - INTERVAL 90 DAY) GROUP BY 1 ) e ON e.user_id = a.user_id group by 1 ,2 ;;
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
