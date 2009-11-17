class CimStatsMonth < ActiveRecord::Base
  
  set_primary_key :month_id
  set_table_name :cim_stats_month
    has_many :weekly_reports, :class_name => 'CimStatsWeeklyreport', :foreign_key => "week_id"

  def self.find_start_date(month_id)
    result = find(:first, :select => 'month_number, month_calendaryear', :conditions => {:month_id => month_id} )
    monthNum = result['month_number']
    curYear = result['month_calendaryear']
    startdate = "#{curYear}-#{monthNum}-#{00}"
    startdate
  end
  
  def self.find_end_date(month_id)
    result = find(:first, :select => 'month_number, month_calendaryear', :conditions => {:month_id => month_id} )
    monthNum = result['month_number']
    curYear = result['month_calendaryear']
    enddate = "#{curYear}-#{monthNum}-#{31}"
    enddate
  end
  
end
