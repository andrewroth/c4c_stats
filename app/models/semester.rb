class Semester < ActiveRecord::Base
  
  load_mappings
  has_many :prc, :class_name => 'Prc', :primary_key => _(:id), :foreign_key => _(:id)
  
  def self.find_semesters_by_year(year_id)
    find(:all, :conditions => {_(:year_id) => year_id})
  end
  
  def self.find_semester_id(description)
    find(:first, :conditions => {_(:description) => description}).id
  end
  
  def self.find_semester_description(id)
    find(:first, :conditions => {_(:id) => id}).description
  end
  
  def self.find_semesters(current_id)
    find(:all, :conditions => ["#{_(:id)} <= ?",current_id]).collect{ |s| [s.description]}
  end
  
end
