class CimStatsMonth < ActiveRecord::Base
  
  # primary_key :month_id
  set_table_name :cim_stats_month

  def self.find_start_date(month_id)
    result = find(:all, :select => 'month_number, month_calendaryear', :conditions => {:month_id => month_id} )
    monthNum = result[0]['month_number']
    curYear = result[0]['month_calendaryear']
    startdate = "#{curYear}-#{monthNum}-#{00}"
    startdate
  end
  
  def self.find_end_date(month_id)
    result = find(:all, :select => 'month_number, month_calendaryear', :conditions => {:month_id => month_id} )
    monthNum = result[0]['month_number']
    curYear = result[0]['month_calendaryear']
    enddate = "#{curYear}-#{monthNum}-#{31}"
    enddate
  end
  
end
