class Prc < ActiveRecord::Base
  
  load_mappings
  belongs_to :campus, :class_name => 'Campus', :foreign_key => _(:id, :campus)
  belongs_to :prcMethod, :class_name => 'Prcmethod', :primary_key => _(:id, :prcmethod), :foreign_key => _(:id, :prcmethod)
  belongs_to :semester, :class_name => 'Semester', :primary_key => _(:id, :semester), :foreign_key => _(:id, :semester)
  
  def self.count_by_date(start_date,end_date,region_id)
    if region_id == 4
      result = self.count(:all, :joins => :campus, :conditions => ["#{_(:region_id, :campus)} != ? AND #{_(:date)} <= ? AND #{_(:date)} > ?",region_id,end_date,start_date])
    else
      result = self.count(:all, :joins => :campus, :conditions => ["#{_(:region_id, :campus)} = ? AND #{_(:date)} <= ? AND #{_(:date)} > ?",region_id,end_date,start_date])
    end
    result
  end
  
  def self.count_by_campus(start_date,end_date,campus_id)
    result = self.count(:all, :conditions => ["#{_(:campus_id)} = ? AND #{_(:date)} <= ? AND #{_(:date)} > ?",campus_id,end_date,start_date])
    result
  end
  
  def self.count_by_semester(semester_id,region_id)
    if region_id == 4
      result = self.count(:all, :joins => :campus, :conditions => ["#{_(:region_id, :campus)} != ? AND #{_(:semester_id)} = ?",region_id,semester_id])
    else
      result = self.count(:all, :joins => :campus, :conditions => ["#{_(:region_id, :campus)} = ? AND #{_(:semester_id)} = ?",region_id,semester_id])
    end
    result
  end
  
end
