class CimStatsWeek < ActiveRecord::Base
  
  set_primary_key :week_id
  set_table_name :cim_stats_week
  has_many :weekly_reports, :class_name => 'CimStatsWeeklyreport', :foreign_key => "week_id"
  
  def self.find_stats_week(week_id,region_id,stat)
    week = find(:first, :conditions => {:week_id => week_id})
    if region_id == national_region
      result = week.weekly_reports.find(:all, :joins => :campus, :conditions => ['cim_hrdb_campus.region_id != ?', region_id])
    else
      result = week.weekly_reports.find(:all, :joins => :campus, :conditions => {'cim_hrdb_campus.region_id' => region_id})
    end
    result.sum(&stat)
  end
  
  def self.find_start_date(week_id)
    result = find(:first, :select => :week_endDate, :conditions => {:week_id => (week_id-1)} )
    startdate = result['week_endDate']
    startdate
  end
  
  def self.find_stats_month(month_id,region_id,stat)
    weeks = find(:all, :conditions => {:month_id => month_id})
    total = 0
    if region_id == national_region
      weeks.each do |week|
        result = week.weekly_reports.find(:all, :joins => :campus, :conditions => ['cim_hrdb_campus.region_id != ?', region_id])
        total += result.sum(&stat)
      end
    else
      weeks.each do |week|
        result = week.weekly_reports.find(:all, :joins => :campus, :conditions => {'cim_hrdb_campus.region_id' => region_id})
        total += result.sum(&stat)
      end
    end
    total
  end
  
  def self.find_stats_semester(semester_id,region_id,stat)
    weeks = find(:all, :conditions => {:semester_id => semester_id})
    total = 0
    if region_id == national_region
      weeks.each do |week|
        result = week.weekly_reports.find(:all, :joins => :campus, :conditions => ['cim_hrdb_campus.region_id != ?', region_id])
        total += result.sum(&stat)
      end
    else
      weeks.each do |week|
        result = week.weekly_reports.find(:all, :joins => :campus, :conditions => {'cim_hrdb_campus.region_id' => region_id})
        total += result.sum(&stat)
      end
    end
    total
  end
  
  def self.find_end_date(week_id)
    result = find(:first, :select => :week_endDate, :conditions => {:week_id => week_id} )
    enddate = result['week_endDate']
    enddate
  end
  
end
