view: mdppc_looker_view_web_detail {
  sql_table_name: dbo.MDPPC_Looker_View_Web_Detail ;;

  dimension_group: date_beg_lcl {
    type: time
    timeframes: [
      raw,
      time,
      time_of_day,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.DATE_BEG_LCL ;;
  }

  dimension_group: date_end_lcl {
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
    sql: ${TABLE}.DATE_END_LCL ;;
  }

dimension_group: date_beg_lcl_time {
  type:  time
  timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
  ]
  sql: ${TABLE}.date_beg_lcl_time ;;


}


  dimension: evt_name {
    type: string
    sql: ${TABLE}.evt_name ;;
  }

  dimension: full_name {
    type: string
    sql: ${TABLE}.full_name ;;
  }

  dimension: src_ame {
    type: string
    sql: ${TABLE}.src_ame ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.URL ;;
  }

  measure: count {
    type: count
    drill_fields: [full_name, evt_name]
  }
}
