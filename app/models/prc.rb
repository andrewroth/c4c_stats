class Prc < ActiveRecord::Base
  
  load_mappings
  belongs_to :campus, :class_name => 'Campus', :foreign_key => _(:id, :campus)
  belongs_to :prcMethod, :class_name => 'Prcmethod', :primary_key => _(:id, :prcmethod), :foreign_key => _(:id, :prcmethod)
  belongs_to :semester, :class_name => 'Semester', :primary_key => _(:id, :semester), :foreign_key => _(:id, :semester)
  
  def self.count_by_date(start_date,end_date,region_id)
    if region_id == national_region
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
    if region_id == national_region
      result = self.count(:all, :joins => :campus, :conditions => ["#{_(:region_id, :campus)} != ? AND #{_(:semester_id)} = ?",region_id,semester_id])
    else
      result = self.count(:all, :joins => :campus, :conditions => ["#{_(:region_id, :campus)} = ? AND #{_(:semester_id)} = ?",region_id,semester_id])
    end
    result
  end
  
  def self.count_by_semester_and_campus(semester_id,campus_id)
    count(:all, :joins => :campus, :conditions => ["#{__(:id, :campus)} = ? AND #{_(:semester_id)} = ?",campus_id,semester_id])
  end
  
  def self.submit_decision(semesterID, campusID, methodID, date, notes, name, witness, believer)
    create(_(:semester_id) => semesterID, _(:campus_id) => campusID, _(:method_id) => methodID, _(:date) => date, _(:notes) => notes, _(:first_name) => name, _(:witness_name) => witness, _(:integrated_believer) => believer)
  end
  
  def self.update_decision(id,semesterID, campusID, methodID, date, notes, name, witness, believer)
    update(id,_(:semester_id) => semesterID, _(:campus_id) => campusID, _(:method_id) => methodID, _(:date) => date, _(:notes) => notes, _(:first_name) => name, _(:witness_name) => witness, _(:integrated_believer) => believer)
  end
  
  def self.find_by_semester_and_campus(semester_id,campus_id)
    find(:all, :joins => :campus, :conditions => ["#{__(:id, :campus)} = ? AND #{_(:semester_id)} = ?",campus_id,semester_id])
  end
  
  def self.find_by_id(id)
    find(:first, :conditions => {_(:id) => id})
  end
  
  def self.delete_by_id(id)
    delete(id)
  end
  
end
