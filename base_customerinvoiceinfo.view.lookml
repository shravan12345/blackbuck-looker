- view: base_customerinvoiceinfo
  sql_table_name: blackbuck_prod.base_customerinvoiceinfo
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: address
    type: string
    sql: ${TABLE}.address

  - dimension: bill_seq_number
    type: number
    sql: ${TABLE}.bill_seq_number

  - dimension: checkpost_template_path
    type: string
    sql: ${TABLE}.checkpost_template_path

  - dimension: customer_id
    type: number
    sql: ${TABLE}.customer_id

  - dimension: customer_rate_type
    type: number
    sql: ${TABLE}.customer_rate_type

  - dimension: detention_template_path
    type: string
    sql: ${TABLE}.detention_template_path

  - dimension: freight_distributed_by
    type: number
    sql: ${TABLE}.freight_distributed_by

  - dimension: invoice_template_path
    type: string
    sql: ${TABLE}.invoice_template_path

  - dimension: last_modified_by_id
    type: number
    sql: ${TABLE}.last_modified_by_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified_date

  - dimension: load_unload_template_path
    type: string
    sql: ${TABLE}.load_unload_template_path

  - dimension: loading_charge_type
    type: number
    sql: ${TABLE}.loading_charge_type

  - dimension: loading_detention_type
    type: number
    sql: ${TABLE}.loading_detention_type

  - dimension: location_id
    type: number
    sql: ${TABLE}.location_id

  - dimension: multiple_load_pt_charge_type
    type: number
    sql: ${TABLE}.multiple_load_pt_charge_type

  - dimension: multiple_unload_pt_charge_type
    type: number
    sql: ${TABLE}.multiple_unload_pt_charge_type

  - dimension: no_order_in_one_invoice
    type: number
    sql: ${TABLE}.no_order_in_one_invoice

  - dimension: order_invoice_type
    type: number
    sql: ${TABLE}.order_invoice_type

  - dimension: plywood_template_path
    type: string
    sql: ${TABLE}.plywood_template_path

  - dimension: remaining_service_tax_in_invoice
    type: yesno
    sql: ${TABLE}.remaining_service_tax_in_invoice

  - dimension: separate_invoice
    type: number
    sql: ${TABLE}.separate_invoice

  - dimension: service_tax_in_invoice
    type: yesno
    sql: ${TABLE}.service_tax_in_invoice

  - dimension: summary_template_path
    type: string
    sql: ${TABLE}.summary_template_path

  - dimension: unloading_charge_type
    type: number
    sql: ${TABLE}.unloading_charge_type

  - dimension: unloading_detention_type
    type: number
    sql: ${TABLE}.unloading_detention_type

  - dimension: use_warehouse_address
    type: yesno
    sql: ${TABLE}.use_warehouse_address

  - measure: count
    type: count
    drill_fields: [id]

