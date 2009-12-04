class Week < ActiveRecord::Base
  
  load_mappings
  has_many :weekly_reports, :class_name => 'Weeklyreport', :foreign_key => _(:id)
  belongs_to :campus, :class_name => 'Campus'
  
  def self.find_stats_staff(week_id,staff_id,stat)
    week = find(:first, :conditions => {_(:id) => week_id})
    result = week.weekly_reports.find(:all, :conditions => [ "#{_(:staff_id)} = ?", staff_id ])
    result.sum(&stat)
  end
  
  def self.find_stats_week(week_id,region_id,stat)
    week = find(:first, :conditions => {_(:id) => week_id})
    if region_id == national_region
      result = week.weekly_reports.find(:all, :joins => :campus, :conditions => [ "#{Campus.table_name}.#{Campus._(:region_id)} != ?", region_id ])
    else
      result = week.weekly_reports.find(:all, :joins => :campus, :conditions => [ "#{Campus.table_name}.#{Campus._(:region_id)} = ?", region_id ])
    end
    result.sum(&stat)
  end
  
  
  def self.find_stats_month(month_id,region_id,stat)
    weeks = find(:all, :conditions => {_(:month_id) => month_id})
    total = 0
    if region_id == national_region
      weeks.each do |week|
        result = week.weekly_reports.find(:all, :joins => :campus, :conditions => [ "#{Campus.table_name}.#{Campus._(:region_id)} != ?", region_id ])
        total += result.sum(&stat)
      end
    else
      weeks.each do |week|
        result = week.weekly_reports.find(:all, :joins => :campus, :conditions => [ "#{Campus.table_name}.#{Campus._(:region_id)} = ?", region_id ])
        total += result.sum(&stat)
      end
    end
    total
  end
  
  def self.find_stats_semester(semester_id,region_id,stat)
    weeks = find(:all, :conditions => {_(:semester_id) => semester_id})
    total = 0
    if region_id == national_region
      weeks.each do |week|
        result = week.weekly_reports.find(:all, :joins => :campus, :conditions => [ "#{Campus.table_name}.#{Campus._(:region_id)} != ?", region_id ])
        total += result.sum(&stat)
      end
    else
      weeks.each do |week|
        result = week.weekly_reports.find(:all, :joins => :campus, :conditions => [ "#{Campus.table_name}.#{Campus._(:region_id)} = ?", region_id ])
        total += result.sum(&stat)
      end
    end
    total
  end
  
  def self.find_stats_semester_campus(semester_id,campus_id,stat)
    weeks = find(:all, :conditions => {_(:semester_id) => semester_id})
    total = 0
    weeks.each do |week|
      result = week.weekly_reports.find(:all, :conditions => {_(:campus_id) => campus_id})
      total += result.sum(&stat)
    end
    total
  end
  
  def self.find_start_date(week_id)
    result = find(:first, :select => :week_endDate, :conditions => {_(:id) => (week_id-1)} )
    startdate = result['week_endDate']
    startdate
  end
  
  def self.find_end_date(week_id)
    result = find(:first, :select => :week_endDate, :conditions => {_(:id) => week_id} )
    enddate = result['week_endDate']
    enddate
  end
  
  def self.find_weeks_in_month(month_id)
    find(:all, :select => _(:id), :conditions => { _(:month_id) => month_id }, :order => _(:id))   
  end
  
  def self.find_weeks_in_semester(semester_id)
    find(:all, :conditions => { _(:semester_id) => semester_id }, :order => _(:id))   
  end
  
end
