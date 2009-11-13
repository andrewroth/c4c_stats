class CimStatsWeeklyreport < ActiveRecord::Base
  
  set_table_name :cim_stats_weeklyreport
  
  def self.find_total_gospres_week(week_id,region_id)
    if region_id == 4
      result = sum(:all, :select => :weeklyReport_1on1GosPres, :conditions => [ "cim_stats_weeklyreport.week_id = ? AND region_id != ?", week_id, region_id ], :joins => "INNER JOIN cim_stats_week ON cim_stats_weeklyreport.week_id = cim_stats_week.week_id INNER JOIN cim_hrdb_campus ON cim_stats_weeklyreport.campus_id = cim_hrdb_campus.campus_id")
    else
      result = sum(:all, :select => :weeklyReport_1on1GosPres, :conditions => [ "cim_stats_weeklyreport.week_id = ? AND region_id = ?", week_id, region_id ], :joins => "INNER JOIN cim_stats_week ON cim_stats_weeklyreport.week_id = cim_stats_week.week_id INNER JOIN cim_hrdb_campus ON cim_stats_weeklyreport.campus_id = cim_hrdb_campus.campus_id")
    end
    result
  end
  
  def self.find_total_gospres_month(month_id,region_id)
    if region_id == 4
      result = sum(:all, :select => :weeklyReport_1on1GosPres, :conditions => [ "cim_stats_week.month_id = ? AND region_id != ?", month_id, region_id ], :joins => "INNER JOIN cim_stats_week ON cim_stats_weeklyreport.week_id = cim_stats_week.week_id INNER JOIN cim_hrdb_campus ON cim_stats_weeklyreport.campus_id = cim_hrdb_campus.campus_id")
    else
      result = sum(:all, :select => :weeklyReport_1on1GosPres, :conditions => [ "cim_stats_week.month_id = ? AND region_id = ?", month_id, region_id ], :joins => "INNER JOIN cim_stats_week ON cim_stats_weeklyreport.week_id = cim_stats_week.week_id INNER JOIN cim_hrdb_campus ON cim_stats_weeklyreport.campus_id = cim_hrdb_campus.campus_id")
    end
    result
  end
  
  def self.find_total_gospres_semester(semester_id,region_id)
    if region_id == 4 
      result = sum(:all, :select => :weeklyReport_1on1GosPres, :conditions => [ "cim_stats_week.semester_id = ? AND region_id != ?", semester_id, region_id ], :joins => "INNER JOIN cim_stats_week ON cim_stats_weeklyreport.week_id = cim_stats_week.week_id INNER JOIN cim_hrdb_campus ON cim_stats_weeklyreport.campus_id = cim_hrdb_campus.campus_id")
    else
      result = sum(:all, :select => :weeklyReport_1on1GosPres, :conditions => [ "cim_stats_week.semester_id = ? AND region_id = ?", semester_id, region_id ], :joins => "INNER JOIN cim_stats_week ON cim_stats_weeklyreport.week_id = cim_stats_week.week_id INNER JOIN cim_hrdb_campus ON cim_stats_weeklyreport.campus_id = cim_hrdb_campus.campus_id")
    end
    result
  end
  
  def self.find_total_spconv_week(week_id,region_id)
    if region_id == 4
      result = sum(:all, :select => :weeklyReport_1on1SpConv, :conditions => [ "cim_stats_weeklyreport.week_id = ? AND region_id != ?", week_id, region_id ], :joins => "INNER JOIN cim_stats_week ON cim_stats_weeklyreport.week_id = cim_stats_week.week_id INNER JOIN cim_hrdb_campus ON cim_stats_weeklyreport.campus_id = cim_hrdb_campus.campus_id")
    else
      result = sum(:all, :select => :weeklyReport_1on1SpConv, :conditions => [ "cim_stats_weeklyreport.week_id = ? AND region_id = ?", week_id, region_id ], :joins => "INNER JOIN cim_stats_week ON cim_stats_weeklyreport.week_id = cim_stats_week.week_id INNER JOIN cim_hrdb_campus ON cim_stats_weeklyreport.campus_id = cim_hrdb_campus.campus_id")
    end
    result
  end
  
  def self.find_total_spconv_month(month_id,region_id)
    if region_id == 4 
      result = sum(:all, :select => :weeklyReport_1on1SpConv, :conditions => [ "cim_stats_week.month_id = ? AND region_id != ?", month_id, region_id ], :joins => "INNER JOIN cim_stats_week ON cim_stats_weeklyreport.week_id = cim_stats_week.week_id INNER JOIN cim_hrdb_campus ON cim_stats_weeklyreport.campus_id = cim_hrdb_campus.campus_id")
    else
      result = sum(:all, :select => :weeklyReport_1on1SpConv, :conditions => [ "cim_stats_week.month_id = ? AND region_id = ?", month_id, region_id ], :joins => "INNER JOIN cim_stats_week ON cim_stats_weeklyreport.week_id = cim_stats_week.week_id INNER JOIN cim_hrdb_campus ON cim_stats_weeklyreport.campus_id = cim_hrdb_campus.campus_id")
    end
    result
  end
  
  def self.find_total_spconv_semester(semester_id,region_id)
    if region_id == 4 
      result = sum(:all, :select => :weeklyReport_1on1SpConv, :conditions => [ "cim_stats_week.semester_id = ? AND region_id != ?", semester_id, region_id ], :joins => "INNER JOIN cim_stats_week ON cim_stats_weeklyreport.week_id = cim_stats_week.week_id INNER JOIN cim_hrdb_campus ON cim_stats_weeklyreport.campus_id = cim_hrdb_campus.campus_id")
    else
      result = sum(:all, :select => :weeklyReport_1on1SpConv, :conditions => [ "cim_stats_week.semester_id = ? AND region_id = ?", semester_id, region_id ], :joins => "INNER JOIN cim_stats_week ON cim_stats_weeklyreport.week_id = cim_stats_week.week_id INNER JOIN cim_hrdb_campus ON cim_stats_weeklyreport.campus_id = cim_hrdb_campus.campus_id")
    end
    result
  end
  
  def self.find_total_hspres_week(week_id,region_id)
    if region_id == 4 
      result = sum(:all, :select => :weeklyReport_1on1HsPres, :conditions => [ "cim_stats_weeklyreport.week_id = ? AND region_id != ?", week_id, region_id ], :joins => "INNER JOIN cim_stats_week ON cim_stats_weeklyreport.week_id = cim_stats_week.week_id INNER JOIN cim_hrdb_campus ON cim_stats_weeklyreport.campus_id = cim_hrdb_campus.campus_id")
    else
      result = sum(:all, :select => :weeklyReport_1on1HsPres, :conditions => [ "cim_stats_weeklyreport.week_id = ? AND region_id = ?", week_id, region_id ], :joins => "INNER JOIN cim_stats_week ON cim_stats_weeklyreport.week_id = cim_stats_week.week_id INNER JOIN cim_hrdb_campus ON cim_stats_weeklyreport.campus_id = cim_hrdb_campus.campus_id")
    end
    result
  end
  
  def self.find_total_hspres_month(month_id,region_id)
    if region_id == 4 
      result = sum(:all, :select => :weeklyReport_1on1HsPres, :conditions => [ "cim_stats_week.month_id = ? AND region_id != ?", month_id, region_id ], :joins => "INNER JOIN cim_stats_week ON cim_stats_weeklyreport.week_id = cim_stats_week.week_id INNER JOIN cim_hrdb_campus ON cim_stats_weeklyreport.campus_id = cim_hrdb_campus.campus_id")
    else
      result = sum(:all, :select => :weeklyReport_1on1HsPres, :conditions => [ "cim_stats_week.month_id = ? AND region_id = ?", month_id, region_id ], :joins => "INNER JOIN cim_stats_week ON cim_stats_weeklyreport.week_id = cim_stats_week.week_id INNER JOIN cim_hrdb_campus ON cim_stats_weeklyreport.campus_id = cim_hrdb_campus.campus_id")
    end
    result
  end
  
  def self.find_total_hspres_semester(semester_id,region_id)
    if region_id == 4 
      result = sum(:all, :select => :weeklyReport_1on1HsPres, :conditions => [ "cim_stats_week.semester_id = ? AND region_id != ?", semester_id, region_id ], :joins => "INNER JOIN cim_stats_week ON cim_stats_weeklyreport.week_id = cim_stats_week.week_id INNER JOIN cim_hrdb_campus ON cim_stats_weeklyreport.campus_id = cim_hrdb_campus.campus_id")
    else
      result = sum(:all, :select => :weeklyReport_1on1HsPres, :conditions => [ "cim_stats_week.semester_id = ? AND region_id = ?", semester_id, region_id ], :joins => "INNER JOIN cim_stats_week ON cim_stats_weeklyreport.week_id = cim_stats_week.week_id INNER JOIN cim_hrdb_campus ON cim_stats_weeklyreport.campus_id = cim_hrdb_campus.campus_id")
    end
    result
  end
  
  def self.find_total_spconvstd_week(week_id,region_id)
    if region_id == 4
      result = sum(:all, :select => :weeklyReport_1on1SpConvStd, :conditions => [ "cim_stats_weeklyreport.week_id = ? AND region_id != ?", week_id, region_id ], :joins => "INNER JOIN cim_stats_week ON cim_stats_weeklyreport.week_id = cim_stats_week.week_id INNER JOIN cim_hrdb_campus ON cim_stats_weeklyreport.campus_id = cim_hrdb_campus.campus_id")
    else
      result = sum(:all, :select => :weeklyReport_1on1SpConvStd, :conditions => [ "cim_stats_weeklyreport.week_id = ? AND region_id = ?", week_id, region_id ], :joins => "INNER JOIN cim_stats_week ON cim_stats_weeklyreport.week_id = cim_stats_week.week_id INNER JOIN cim_hrdb_campus ON cim_stats_weeklyreport.campus_id = cim_hrdb_campus.campus_id")
    end
    result
  end
  
  def self.find_total_spconvstd_month(month_id,region_id)
    if region_id == 4 
      result = sum(:all, :select => :weeklyReport_1on1SpConvStd, :conditions => [ "cim_stats_week.month_id = ? AND region_id != ?", month_id, region_id ], :joins => "INNER JOIN cim_stats_week ON cim_stats_weeklyreport.week_id = cim_stats_week.week_id INNER JOIN cim_hrdb_campus ON cim_stats_weeklyreport.campus_id = cim_hrdb_campus.campus_id")
    else
      result = sum(:all, :select => :weeklyReport_1on1SpConvStd, :conditions => [ "cim_stats_week.month_id = ? AND region_id = ?", month_id, region_id ], :joins => "INNER JOIN cim_stats_week ON cim_stats_weeklyreport.week_id = cim_stats_week.week_id INNER JOIN cim_hrdb_campus ON cim_stats_weeklyreport.campus_id = cim_hrdb_campus.campus_id")
    end
    result
  end
  
  def self.find_total_spconvstd_semester(semester_id,region_id)
    if region_id == 4 
      result = sum(:all, :select => :weeklyReport_1on1SpConvStd, :conditions => [ "cim_stats_week.semester_id = ? AND region_id != ?", semester_id, region_id ], :joins => "INNER JOIN cim_stats_week ON cim_stats_weeklyreport.week_id = cim_stats_week.week_id INNER JOIN cim_hrdb_campus ON cim_stats_weeklyreport.campus_id = cim_hrdb_campus.campus_id")
    else
      result = sum(:all, :select => :weeklyReport_1on1SpConvStd, :conditions => [ "cim_stats_week.semester_id = ? AND region_id = ?", semester_id, region_id ], :joins => "INNER JOIN cim_stats_week ON cim_stats_weeklyreport.week_id = cim_stats_week.week_id INNER JOIN cim_hrdb_campus ON cim_stats_weeklyreport.campus_id = cim_hrdb_campus.campus_id")
    end
    result
  end
  
  def self.find_total_gospresstd_week(week_id,region_id)
    if region_id == 4 
      result = sum(:all, :select => :weeklyReport_1on1GosPresStd, :conditions => [ "cim_stats_weeklyreport.week_id = ? AND region_id != ?", week_id, region_id ], :joins => "INNER JOIN cim_stats_week ON cim_stats_weeklyreport.week_id = cim_stats_week.week_id INNER JOIN cim_hrdb_campus ON cim_stats_weeklyreport.campus_id = cim_hrdb_campus.campus_id")
    else
      result = sum(:all, :select => :weeklyReport_1on1GosPresStd, :conditions => [ "cim_stats_weeklyreport.week_id = ? AND region_id = ?", week_id, region_id ], :joins => "INNER JOIN cim_stats_week ON cim_stats_weeklyreport.week_id = cim_stats_week.week_id INNER JOIN cim_hrdb_campus ON cim_stats_weeklyreport.campus_id = cim_hrdb_campus.campus_id")
    end
    result
  end
  
  def self.find_total_gospresstd_month(month_id,region_id)
    if region_id == 4 
      result = sum(:all, :select => :weeklyReport_1on1GosPresStd, :conditions => [ "cim_stats_week.month_id = ? AND region_id != ?", month_id, region_id ], :joins => "INNER JOIN cim_stats_week ON cim_stats_weeklyreport.week_id = cim_stats_week.week_id INNER JOIN cim_hrdb_campus ON cim_stats_weeklyreport.campus_id = cim_hrdb_campus.campus_id")
    else
      result = sum(:all, :select => :weeklyReport_1on1GosPresStd, :conditions => [ "cim_stats_week.month_id = ? AND region_id = ?", month_id, region_id ], :joins => "INNER JOIN cim_stats_week ON cim_stats_weeklyreport.week_id = cim_stats_week.week_id INNER JOIN cim_hrdb_campus ON cim_stats_weeklyreport.campus_id = cim_hrdb_campus.campus_id")
    end
    result
  end
  
  def self.find_total_gospresstd_semester(semester_id,region_id)
    if region_id == 4 
      result = sum(:all, :select => :weeklyReport_1on1GosPresStd, :conditions => [ "cim_stats_week.semester_id = ? AND region_id != ?", semester_id, region_id ], :joins => "INNER JOIN cim_stats_week ON cim_stats_weeklyreport.week_id = cim_stats_week.week_id INNER JOIN cim_hrdb_campus ON cim_stats_weeklyreport.campus_id = cim_hrdb_campus.campus_id")
    else
      result = sum(:all, :select => :weeklyReport_1on1GosPresStd, :conditions => [ "cim_stats_week.semester_id = ? AND region_id = ?", semester_id, region_id ], :joins => "INNER JOIN cim_stats_week ON cim_stats_weeklyreport.week_id = cim_stats_week.week_id INNER JOIN cim_hrdb_campus ON cim_stats_weeklyreport.campus_id = cim_hrdb_campus.campus_id")
    end
    result
  end
  
end
