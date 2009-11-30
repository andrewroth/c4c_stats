class Year < ActiveRecord::Base
  
  load_mappings
  
  def self.find_year_id(description)
    find(:first, :conditions => {_(:description) => description}).id
  end
  
  def self.find_year_description(id)
    find(:first, :conditions => {_(:id) => id}).description
  end
  
  def self.find_years(current_id)
    find(:all, :conditions => ["#{_(:id)} <= ?",current_id]).collect{ |y| [y.description] } 
  end
  
end