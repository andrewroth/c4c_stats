class Person < ActiveRecord::Base
  
  load_mappings
  
  def self.find_person(person_id)
    find(:first, :conditions => {_(:id) => person_id})
  end
end