class Weeklyreport < ActiveRecord::Base
  
  load_mappings
  belongs_to :week, :class_name => 'Week'
  belongs_to :campus, :class_name => 'Campus'
  
  def self.find_stats_campus(month_id,campus_id,stat)
    result = find(:all, :joins => :week, :conditions => ["#{_(:campus_id)} = ? AND #{_(:month_id, :week)} = ?",campus_id,month_id] )
    total = result.sum(&stat)
    total
  end
  
end