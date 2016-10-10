- view: base_customeruserprofile
  sql_table_name: zinka.base_customeruserprofile
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id
    hidden: true

  - dimension: address
    type: string
    sql: ${TABLE}.address
    hidden: true

  - dimension: advance_percentage
    type: number
    sql: ${TABLE}.advance_percentage
    

  - dimension: advance_t_plus_days
    type: number
    sql: ${TABLE}.advance_t_plus_days
    hidden: true

  - dimension: bill_discounting_financier_id
    type: number
    sql: ${TABLE}.bill_discounting_financier_id
    hidden: true

  - dimension: charge_service_tax_to_customer
    type: yesno
    sql: ${TABLE}.charge_service_tax_to_customer
    hidden: true

  - dimension: checkpost_template_path
    type: string
    sql: ${TABLE}.checkpost_template_path
    hidden: true

  - dimension: company_type
    type: number
    sql: ${TABLE}.company_type
    hidden: true

  - dimension: current_order_num
    type: number
    sql: ${TABLE}.current_order_num
    hidden: true

  - dimension: customer_rate_type
    type: number
    sql: ${TABLE}.customer_rate_type

  - dimension: customer_type
    type: number
    sql: ${TABLE}.customer_type
    hidden: true

  - dimension: detention_template_path
    type: string
    sql: ${TABLE}.detention_template_path
    hidden: true

  - dimension: fields_visible
    type: number
    sql: ${TABLE}.fields_visible
    hidden: true

  - dimension: finance_contact_name
    type: string
    sql: ${TABLE}.finance_contact_name
    hidden: true

  - dimension: finance_contact_number
    type: string
    sql: ${TABLE}.finance_contact_number
    hidden: true

  - dimension: freight_distributed_by
    type: number
    sql: ${TABLE}.freight_distributed_by
    hidden: true

  - dimension: generate_truck_track_status_reports
    type: yesno
    sql: ${TABLE}.generate_truck_track_status_reports
    hidden: true

  - dimension: generate_weekly_placement_reports
    type: yesno
    sql: ${TABLE}.generate_weekly_placement_reports
    hidden: true

  - dimension: invoice_ready_criteria
    type: number
    sql: ${TABLE}.invoice_ready_criteria
    hidden: true

  - dimension: invoice_template_path
    type: string
    sql: ${TABLE}.invoice_template_path
    hidden: true

  - dimension: load_unload_template_path
    type: string
    sql: ${TABLE}.load_unload_template_path
    hidden: true

  - dimension: loading_charge_type
    type: number
    sql: ${TABLE}.loading_charge_type
    hidden: true

  - dimension: loading_detention_type
    type: number
    sql: ${TABLE}.loading_detention_type
    hidden: true

  - dimension: logistic_contact_name
    type: string
    sql: ${TABLE}.logistic_contact_name
    hidden: true

  - dimension: logistic_contact_number
    type: string
    sql: ${TABLE}.logistic_contact_number
    hidden: true

  - dimension: mode_of_generation
    type: number
    sql: ${TABLE}.mode_of_generation
    hidden: true

  - dimension: multiple_load_pt_charge_type
    type: number
    sql: ${TABLE}.multiple_load_pt_charge_type
    hidden: true

  - dimension: multiple_unload_pt_charge_type
    type: number
    sql: ${TABLE}.multiple_unload_pt_charge_type
    hidden: true

  - dimension: name
    type: string
    sql: ${TABLE}.name
    hidden: true

  - dimension: no_order_in_one_invoice
    type: number
    sql: ${TABLE}.no_order_in_one_invoice
    hidden: true

  - dimension: num_invoices_settlement
    type: number
    sql: ${TABLE}.num_invoices_settlement
    hidden: true

  - dimension: order_cutoff_duration
    type: number
    sql: ${TABLE}.order_cutoff_duration
    hidden: true

  - dimension: order_invoice_type
    type: number
    sql: ${TABLE}.order_invoice_type
    hidden: true

  - dimension: our_vendor_code
    type: string
    sql: ${TABLE}.our_vendor_code
    hidden: true

  - dimension: pan_number
    type: string
    sql: ${TABLE}.pan_number
    hidden: true

  - dimension: placement_sla
    type: number
    sql: ${TABLE}.placement_sla
    hidden: true

  - dimension: plywood_template_path
    type: string
    sql: ${TABLE}.plywood_template_path
    hidden: true

  - dimension: receivable_category
    type: number
    sql: ${TABLE}.receivable_category
    hidden: true

  - dimension: remaining_service_tax_in_invoice
    type: yesno
    sql: ${TABLE}.remaining_service_tax_in_invoice
    hidden: true

  - dimension: required_docs_loading
    type: number
    sql: ${TABLE}.required_docs_loading
    hidden: true

  - dimension: required_docs_settlement
    type: number
    sql: ${TABLE}.required_docs_settlement
    hidden: true

  - dimension: sector_type_id
    type: number
    sql: ${TABLE}.sector_type_id
    hidden: true

  - dimension: separate_invoice
    type: number
    sql: ${TABLE}.separate_invoice
    hidden: true

  - dimension: service_tax_in_invoice
    type: yesno
    sql: ${TABLE}.service_tax_in_invoice
    hidden: true

  - dimension: settlement_t_plus_days
    type: number
    sql: ${TABLE}.settlement_t_plus_days
    hidden: true

  - dimension: short_name
    type: string
    sql: ${TABLE}.short_name

  - dimension: show_customer_contract_rate
    type: yesno
    sql: ${TABLE}.show_customer_contract_rate
    hidden: true

  - dimension: show_customer_price
    type: yesno
    sql: ${TABLE}.show_customer_price
    hidden: true

  - dimension: summary_template_path
    type: string
    sql: ${TABLE}.summary_template_path
    hidden: true

  - dimension: tally_cost_center
    type: string
    sql: ${TABLE}.tally_cost_center
    hidden: true

  - dimension: tally_ledger_name
    type: string
    sql: ${TABLE}.tally_ledger_name
    hidden: true

  - dimension: unloading_charge_type
    type: number
    sql: ${TABLE}.unloading_charge_type
    hidden: true

  - dimension: unloading_detention_type
    type: number
    sql: ${TABLE}.unloading_detention_type
    hidden: true

  - dimension: use_warehouse_address
    type: yesno
    sql: ${TABLE}.use_warehouse_address
    hidden: true

  - dimension: user_id
    type: number
    sql: ${TABLE}.user_id

  - dimension: visible_docs_loading
    type: number
    sql: ${TABLE}.visible_docs_loading
    hidden: true

  - dimension: visible_docs_settlement
    type: number
    sql: ${TABLE}.visible_docs_settlement
    hidden: true

  - measure: count
    type: count
    drill_fields: detail*
    
  - measure: count_new
    type: count
    filters:
       base_order.end_date: before 0 months ago
    
  


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - id
    - short_name
    - name
    - tally_ledger_name
    - finance_contact_name
    - logistic_contact_name