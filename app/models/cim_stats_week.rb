class CimStatsWeek < ActiveRecord::Base

 set_table_name :cim_stats_week

  def self.find_start_date(week_id)
    result = find(:all, :select => :week_endDate, :conditions => {:week_id => (week_id-1)} )
    startdate = result[0]['week_endDate']
    startdate
  end
  
  def self.find_end_date(week_id)
    result = find(:all, :select => :week_endDate, :conditions => {:week_id => week_id} )
    enddate = result[0]['week_endDate']
    enddate
  end
end
