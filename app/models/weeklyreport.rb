class Weeklyreport < ActiveRecord::Base
  
  load_mappings
  belongs_to :week, :class_name => 'Week'
  belongs_to :campus, :class_name => 'Campus'
  
  def self.find_stats_campus(month_id,campus_id,stat)
    result = find(:all, :joins => :week, :conditions => ["#{_(:campus_id)} = ? AND #{_(:month_id, :week)} = ?",campus_id,month_id] )
    total = result.sum(&stat)
    total
  end
  
  def self.find_staff(semester_id,campus_id)
    find(:all, :joins => :week, :select => 'DISTINCT staff_id', :conditions => ["#{Week.table_name}.#{Week._(:semester_id, :week)} = ? AND #{_(:campus_id)} = ?", semester_id, campus_id])
  end
  
  def self.check_submitted(week_id, staff_id)
    find(:first, :conditions => {_(:week_id) => week_id, _(:staff_id) => staff_id})
  end
  
end