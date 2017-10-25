view: customer_execution_liquidity {
  derived_table: {
    sql: select
      r.Customer_id, r.Customer_name, r.company_name, e.Cust_Number,
      r.D1_R as 'D1_Requested_Trucks',
      r.D7_R as 'D7_Requested',
      r.MTD_R as 'MTD_Requested',
      r.M1_R as 'M1_Requested',
      r.M2_R as 'M2_Requested',
      e.D1_E as 'D1_Executed_Trucks',
      e.D7_E as 'D7_Executed',
      e.MTD_E as 'MTD_Executed',
      e.M1_E as 'M1_Executed',
      e.M2_E as 'M2_Executed',
      e.D1_E/r.D1_R as 'D1_Liquidity',
      e.D7_E/r.D7_R as 'D7_Liquidity',
      e.MTD_E/r.MTD_R as 'MTD_Liquidity',
      e.M1_E/r.M1_R as 'M1_Liquidity',
      e.M2_E/r.M2_R as 'M2_Liquidity'
      from (
      select
      bup.user_id AS 'Customer_id', bup.name as 'Customer_name', bup.company_name,
      sum(case when date(eor.dt_added) = (current_date()-interval 1 day) then eor.load end)/32 as 'D1_R',
      sum(case when date(eor.dt_added) between (current_date()-interval 7 day) and (current_date()-interval 1 day) then eor.load end)/32 as 'D7_R',
      sum(case when month(eor.dt_added) = month(current_date) then eor.load end)/32 as 'MTD_R',
      sum(case when month(eor.dt_added) = month(current_date)-1 then eor.load end)/32 as 'M1_R',
      sum(case when month(eor.dt_added) = month(current_date)-2 then eor.load end)/32 as 'M2_R'
      from newbb.enquiry_orderrequest eor
      left join newbb.base_userprofile bup on bup.user_id = eor.customer_id
      where date(eor.dt_added) between (last_Day(current_Date() - interval 3 month) + interval 1 day) and current_date()
      and eor.business_type = 'nb'
      and eor.cluster_id = 2
      and eor.load <= 1000
      group by 1,2,3
      ) r
      left join(
      select
      eor.customer_id as 'Customer_id',
      auc.username as 'Cust_Number',
      count(case when date(oa.dt_added) = (current_date()-interval 1 day) then bo.id end) as 'D1_E',
      count(case when date(oa.dt_added) between (current_date()-interval 7 day) and (current_date()-interval 1 day) then eor.load end) as 'D7_E',
      count(case when month(oa.dt_added) = month(current_date) then eor.load end) as 'MTD_E',
      count(case when month(oa.dt_added) = month(current_date)-1 then eor.load end) as 'M1_E',
      count(case when month(oa.dt_added) = month(current_date)-2 then eor.load end) as 'M2_E'
      from base_order bo
      join newbb.enquiry_order eo on eo.id = bo.client_handshake_order_id
      left join base_location blf on blf.id = bo.from_city_id
      left join base_status oa on oa.order_id = bo.id and oa.status = 'Order Accepted'
      left join newbb.enquiry_orderrequest eor on eo.order_request_id = eor.id
      left join newbb.base_userprofile bupc on eor.customer_id = bupc.user_id
      left join newbb.auth_user auc on auc.id = bupc.user_id
      where date(oa.dt_added) between (last_Day(current_Date() - interval 3 month) + interval 1 day) and current_date()
      and bo.client_order_id is not null
      and eor.cluster_id = 2
      and eor.business_type = 'nb'
      and bo.status in ('Cancelled By Customer','Cancelled','Order Processing','KAM Review','Ops Review','Order Incomplete')
      group by 1,2
      ) e on r.Customer_id = e.Customer_id
      order by 5 desc, 7 desc ;;

    }

    dimension: Customer_id  {
      type: number
      sql: ${TABLE}.Customer_id ;;
    }
    dimension: customer_name {
      type: string
      sql: ${TABLE}.customer_name ;;
    }

    dimension: company_name {
      type: string
      sql: ${TABLE}.company_name ;;
    }

    dimension: Cust_Number  {
      type: number
      sql: ${TABLE}.Cust_Number ;;
    }

    dimension: D1_Requested_Trucks {
      type: number
      sql:${TABLE}.D1_Requested_Trucks
      value_format: "0";;
    }

    dimension: D7_Requested {
      type: number
      sql:${TABLE}.D7_Requested
      value_format: "0";;
    }

    dimension: MTD_Requested {
      type: number
      sql:${TABLE}.MTD_Requested
      value_format: "0";;
    }

    dimension: M1_Requested {
      type: number
      sql:${TABLE}.M1_Requested
      value_format: "0";;
    }

    dimension: M2_Requested {
      type: number
      sql:${TABLE}.M2_Requested
      value_format: "0";;
    }

    dimension: D1_Executed_Trucks {
      type: number
      sql:${TABLE}.D1_Executed_Trucks  ;;
    }

    dimension: D7_Executed {
      type: number
      sql:${TABLE}.D7_Executed  ;;
    }

    dimension: MTD_Executed {
      type: number
      sql:${TABLE}.MTD_Executed  ;;
    }

    dimension: M1_Executed {
      type: number
      sql:${TABLE}.M1_Executed  ;;
    }

    dimension: M2_Executed {
      type: number
      sql:${TABLE}.M2_Executed  ;;
    }

    dimension: D1_Liquidity {
      type: number
      sql:${TABLE}.D1_Liquidity  ;;
      value_format: "0%"
    }

    dimension: D7_Liquidity {
      type: number
      sql:${TABLE}.D7_Liquidity  ;;
      value_format: "0%"
    }

    dimension: MTD_Liquidity {
      type: number
      sql:${TABLE}.MTD_Liquidity  ;;
      value_format: "0%"
    }

    dimension: M1_Liquidity {
      type: number
      sql:${TABLE}.M1_Liquidity  ;;
      value_format: "0%"
    }

    dimension: M2_Liquidity {
      type: number
      sql:${TABLE}.M2_Liquidity  ;;
      value_format: "0%"
    }
  }
