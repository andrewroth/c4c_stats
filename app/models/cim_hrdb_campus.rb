class CimHrdbCampus < ActiveRecord::Base
  
  set_primary_key :campus_id
  set_table_name :cim_hrdb_campus
  has_many :weekly_reports, :class_name => 'CimStatsWeeklyreport', :foreign_key => 'campus_id'
  
end