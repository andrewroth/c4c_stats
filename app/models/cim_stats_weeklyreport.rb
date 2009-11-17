class CimStatsWeeklyreport < ActiveRecord::Base
  
  set_primary_key :weeklyReport_id
  set_table_name :cim_stats_weeklyreport
  belongs_to :week, :class_name => 'CimStatsWeek'
  belongs_to :campus, :class_name => 'CimHrdbCampus'
  belongs_to :month, :class_name => 'CimStatsMonth'
  
end