view: payments_dashboard {
  derived_table: {
    sql: select
ft.id,
ft.order_id,
ft.date_of_transaction,
concat_ws(' ', aufu.first_name, aufu.last_name) as finance_user_name,
ft.beneficiary_ifsc,
ft.beneficiary_name,
ft.beneficiary_acc_num,
ib.bank,
ft.amount,
ft.state,
(case when ft.payment_reason = 0 then "Advance"
      when ft.payment_reason = 1 then "Settlement"
      when ft.payment_reason = 11 then "Others"
      else ft.payment_reason end) as payment_reason,
(case when ft.payment_mode = 1 then "Cash"
      when ft.payment_mode = 2 then "eTransfer"
      when ft.payment_mode = 3 then "Fuel Payment"
      when ft.payment_mode = 4 then "Adhoc Payment"
      else ft.payment_mode end) as payment_mode,
ft.comments,
group_concat(it.bank_ref_num separator '_') as bank_ref_nums,
bt.registration_number as truck,
concat_ws(' ',aumg.first_name,aumg.last_name) as supply_partner,
it.failure_reason,
bst.sector_name,
bbt.business_name
from base_financialtransaction ft
left join auth_user aufu ON ft.user_id = aufu.id
left join base_impstransaction it ON ft.id = it.fin_transaction_id
left join base_truck bt on ft.entity_id = bt.id
left join base_mgtruck mg on mg.truck_id=ft.entity_id
left join auth_user aumg on aumg.id=mg.supply_partner_id
left join base_impsbank ib on ib.id = ft.transaction_bank_id
left join base_order bo on bo.id = ft.order_id
left join base_sectortype bst on bst.id = bo.customer_sector_id
left join base_businesstype bbt on bbt.id = bst.business_type_id
group by 1 ;;

    }

    dimension: id  {
      type: number
      sql: ${TABLE}.id ;;
    }

  dimension: order_id  {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: date_of_transaction {
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
    sql: ${TABLE}.date_of_transaction ;;
  }

    dimension: finance_user_name {
      type: string
      sql:${TABLE}.finance_user_name  ;;
    }

  dimension: beneficiary_ifsc {
    type: string
    sql:${TABLE}.beneficiary_ifsc  ;;
  }

  dimension: beneficiary_name {
    type: string
    sql:${TABLE}.beneficiary_name  ;;
  }

  dimension: beneficiary_acc_num {
    type: string
    sql:${TABLE}.beneficiary_acc_num  ;;
  }

  dimension: bank {
    type: string
    sql:${TABLE}.bank  ;;
  }

  dimension: amount {
    type: number
    sql:${TABLE}.amount  ;;
  }

  dimension: state {
    type: string
    sql:${TABLE}.state  ;;
  }

  dimension: payment_reason {
    type: string
    sql:${TABLE}.payment_reason  ;;
  }

  dimension: payment_mode {
    type: string
    sql:${TABLE}.payment_mode  ;;
  }

  dimension: comments {
    type: string
    sql:${TABLE}.comments  ;;
  }

  dimension: bank_ref_nums {
    type: string
    sql:${TABLE}.bank_ref_nums  ;;
  }

  dimension: truck {
    type: string
    sql:${TABLE}.truck  ;;
  }

  dimension: supply_partner {
    type: string
    sql:${TABLE}.supply_partner  ;;
  }

  dimension: failure_reason {
    type: string
    sql:${TABLE}.failure_reason  ;;
  }

  dimension: sector_name {
    type: string
    sql:${TABLE}.sector_name  ;;
  }

  dimension: business_name {
    type: string
    sql:${TABLE}.business_name  ;;
  }

  }
