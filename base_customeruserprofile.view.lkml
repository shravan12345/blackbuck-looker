view: base_customeruserprofile {
  sql_table_name: zinka.base_customeruserprofile ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
    hidden: yes
  }

  dimension: advance_percentage {
    type: number
    sql: ${TABLE}.advance_percentage ;;
  }

  dimension: advance_t_plus_days {
    type: number
    sql: ${TABLE}.advance_t_plus_days ;;
    hidden: yes
  }

  dimension: bill_discounting_financier_id {
    type: number
    sql: ${TABLE}.bill_discounting_financier_id ;;
    hidden: yes
  }

  dimension: charge_service_tax_to_customer {
    type: yesno
    sql: ${TABLE}.charge_service_tax_to_customer ;;
    hidden: yes
  }

  dimension: checkpost_template_path {
    type: string
    sql: ${TABLE}.checkpost_template_path ;;
    hidden: yes
  }

  dimension: company_type {
    type: number
    sql: ${TABLE}.company_type ;;
    hidden: yes
  }

  dimension: current_order_num {
    type: number
    sql: ${TABLE}.current_order_num ;;
    hidden: yes
  }

  dimension: customer_rate_type {
    type: number
    sql: ${TABLE}.customer_rate_type ;;
  }

  dimension: customer_type {
    type: number
    sql: ${TABLE}.customer_type ;;
    hidden: yes
  }

  dimension: detention_template_path {
    type: string
    sql: ${TABLE}.detention_template_path ;;
    hidden: yes
  }

  dimension: fields_visible {
    type: number
    sql: ${TABLE}.fields_visible ;;
    hidden: yes
  }

  dimension: finance_contact_name {
    type: string
    sql: ${TABLE}.finance_contact_name ;;
    hidden: yes
  }

  dimension: finance_contact_number {
    type: string
    sql: ${TABLE}.finance_contact_number ;;
    hidden: yes
  }

  dimension: freight_distributed_by {
    type: number
    sql: ${TABLE}.freight_distributed_by ;;
    hidden: yes
  }

  dimension: generate_truck_track_status_reports {
    type: yesno
    sql: ${TABLE}.generate_truck_track_status_reports ;;
    hidden: yes
  }

  dimension: generate_weekly_placement_reports {
    type: yesno
    sql: ${TABLE}.generate_weekly_placement_reports ;;
    hidden: yes
  }

  dimension: invoice_ready_criteria {
    type: number
    sql: ${TABLE}.invoice_ready_criteria ;;
    hidden: yes
  }

  dimension: invoice_template_path {
    type: string
    sql: ${TABLE}.invoice_template_path ;;
    hidden: yes
  }

  dimension: load_unload_template_path {
    type: string
    sql: ${TABLE}.load_unload_template_path ;;
    hidden: yes
  }

  dimension: loading_charge_type {
    type: number
    sql: ${TABLE}.loading_charge_type ;;
    hidden: yes
  }

  dimension: loading_detention_type {
    type: number
    sql: ${TABLE}.loading_detention_type ;;
    hidden: yes
  }

  dimension: logistic_contact_name {
    type: string
    sql: ${TABLE}.logistic_contact_name ;;
    hidden: yes
  }

  dimension: logistic_contact_number {
    type: string
    sql: ${TABLE}.logistic_contact_number ;;
    hidden: yes
  }

  dimension: mode_of_generation {
    type: number
    sql: ${TABLE}.mode_of_generation ;;
    hidden: yes
  }

  dimension: multiple_load_pt_charge_type {
    type: number
    sql: ${TABLE}.multiple_load_pt_charge_type ;;
    hidden: yes
  }

  dimension: multiple_unload_pt_charge_type {
    type: number
    sql: ${TABLE}.multiple_unload_pt_charge_type ;;
    hidden: yes
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    hidden: yes
  }

  dimension: no_order_in_one_invoice {
    type: number
    sql: ${TABLE}.no_order_in_one_invoice ;;
    hidden: yes
  }

  dimension: num_invoices_settlement {
    type: number
    sql: ${TABLE}.num_invoices_settlement ;;
    hidden: yes
  }

  dimension: order_cutoff_duration {
    type: number
    sql: ${TABLE}.order_cutoff_duration ;;
    hidden: yes
  }

  dimension: order_invoice_type {
    type: number
    sql: ${TABLE}.order_invoice_type ;;
    hidden: yes
  }

  dimension: our_vendor_code {
    type: string
    sql: ${TABLE}.our_vendor_code ;;
    hidden: yes
  }

  dimension: pan_number {
    type: string
    sql: ${TABLE}.pan_number ;;
    hidden: yes
  }

  dimension: placement_sla {
    type: number
    sql: ${TABLE}.placement_sla ;;
    hidden: yes
  }

  dimension: plywood_template_path {
    type: string
    sql: ${TABLE}.plywood_template_path ;;
    hidden: yes
  }

  dimension: receivable_category {
    type: number
    sql: ${TABLE}.receivable_category ;;
    hidden: yes
  }

  dimension: remaining_service_tax_in_invoice {
    type: yesno
    sql: ${TABLE}.remaining_service_tax_in_invoice ;;
    hidden: yes
  }

  dimension: required_docs_loading {
    type: number
    sql: ${TABLE}.required_docs_loading ;;
    hidden: yes
  }

  dimension: required_docs_settlement {
    type: number
    sql: ${TABLE}.required_docs_settlement ;;
    hidden: yes
  }

  dimension: sector_type_id {
    type: number
    sql: ${TABLE}.sector_type_id ;;
    hidden: yes
  }

  dimension: separate_invoice {
    type: number
    sql: ${TABLE}.separate_invoice ;;
    hidden: yes
  }

  dimension: service_tax_in_invoice {
    type: yesno
    sql: ${TABLE}.service_tax_in_invoice ;;
    hidden: yes
  }

  dimension: settlement_t_plus_days {
    type: number
    sql: ${TABLE}.settlement_t_plus_days ;;
    hidden: yes
  }

  dimension: short_name {
    type: string
    sql: ${TABLE}.short_name ;;
  }

  dimension: show_customer_contract_rate {
    type: yesno
    sql: ${TABLE}.show_customer_contract_rate ;;
    hidden: yes
  }

  dimension: show_customer_price {
    type: yesno
    sql: ${TABLE}.show_customer_price ;;
    hidden: yes
  }

  dimension: summary_template_path {
    type: string
    sql: ${TABLE}.summary_template_path ;;
    hidden: yes
  }

  dimension: tally_cost_center {
    type: string
    sql: ${TABLE}.tally_cost_center ;;
    hidden: yes
  }

  dimension: tally_ledger_name {
    type: string
    sql: ${TABLE}.tally_ledger_name ;;
    hidden: yes
  }

  dimension: unloading_charge_type {
    type: number
    sql: ${TABLE}.unloading_charge_type ;;
    hidden: yes
  }

  dimension: unloading_detention_type {
    type: number
    sql: ${TABLE}.unloading_detention_type ;;
    hidden: yes
  }

  dimension: use_warehouse_address {
    type: yesno
    sql: ${TABLE}.use_warehouse_address ;;
    hidden: yes
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: visible_docs_loading {
    type: number
    sql: ${TABLE}.visible_docs_loading ;;
    hidden: yes
  }

  dimension: visible_docs_settlement {
    type: number
    sql: ${TABLE}.visible_docs_settlement ;;
    hidden: yes
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: count_new {
    type: count

    filters: {
      field: base_order.end_date
      value: "before 0 months ago"
    }
  }

  measure: New_customers {
    type: number
    sql: (${count}-${count_new}) ;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [id, short_name, name, tally_ledger_name, finance_contact_name, logistic_contact_name]
  }
}
