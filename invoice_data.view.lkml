view: invoice_data {
  derived_table: {
    sql: select fbn.order_id as 'Order_Id',
ci.id as 'Invoice_Id',
date(ci.inv_generation_date)  as 'Invoice_Date',
blf.city as 'From_City'
from base_customerinvoice ci
left join base_order_freight_bill_number fbn on fbn.customerinvoice_id = ci.id
left join base_order bo on bo.id = fbn.order_id
left join base_location blf on blf.id = bo.from_city_id
where date(ci.inv_generation_date) >= '2017-08-01'
order by 2 desc ;;

    }

    dimension: Order_Id  {
      type: number
      sql: ${TABLE}.Order_Id ;;
    }
  dimension: Invoice_Id  {
    type: number
    sql: ${TABLE}.Invoice_Id ;;
  }

    dimension: Invoice_Date {
      type: date
      sql: ${TABLE}.Invoice_Date ;;
    }


    dimension: From_City {
      type: string
      sql:${TABLE}.From_City  ;;
    }

  }
