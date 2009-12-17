class Person < ActiveRecord::Base
  
  load_mappings
  
  # This method will return the person associated with a given id
  def self.find_person(person_id)
    find(:first, :conditions => {_(:id) => person_id})
  end
  
end