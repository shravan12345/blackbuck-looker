- view: base_mgsubcontract
  sql_table_name: zinka.base_mgsubcontract
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: bonus_amount
    type: number
    sql: ${TABLE}.bonus_amount

  - dimension: bonus_remarks
    type: string
    sql: ${TABLE}.bonus_remarks

  - dimension: contract_id
    type: number
    sql: ${TABLE}.contract_id

  - dimension: created_by_id
    type: number
    sql: ${TABLE}.created_by_id

  - dimension: damages
    type: number
    sql: ${TABLE}.damages

  - dimension: distance_calculated
    type: number
    sql: ${TABLE}.distance_calculated

  - dimension: distance_reported
    type: number
    sql: ${TABLE}.distance_reported

  - dimension_group: dt_added
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_added

  - dimension_group: dt_updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_updated

  - dimension_group: end
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.end_date

  - dimension: is_settled
    type: yesno
    sql: ${TABLE}.is_settled

  - dimension: loading_correction
    type: number
    sql: ${TABLE}.loading_correction

  - dimension: mg_executive_id
    type: number
    sql: ${TABLE}.mg_executive_id

  - dimension: mg_settlement
    type: number
    sql: ${TABLE}.mg_settlement

  - dimension: misc_charges
    type: number
    sql: ${TABLE}.misc_charges

  - dimension: misc_comments
    type: string
    sql: ${TABLE}.misc_comments

  - dimension: penalty
    type: number
    sql: ${TABLE}.penalty

  - dimension: penalty_remarks
    type: string
    sql: ${TABLE}.penalty_remarks

  - dimension: post_pod_settlement
    type: number
    sql: ${TABLE}.post_pod_settlement

  - dimension: settlement_correction
    type: number
    sql: ${TABLE}.settlement_correction

  - dimension_group: start
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.start_date

  - dimension: state
    type: number
    sql: ${TABLE}.state

  - dimension: supply_bank_id
    type: number
    sql: ${TABLE}.supply_bank_id

  - dimension: total_amount_paid
    type: number
    value_format_name: id
    sql: ${TABLE}.total_amount_paid

  - dimension: total_mg_amount
    type: number
    sql: ${TABLE}.total_mg_amount

  - measure: count
    type: count
    drill_fields: [id]