class Staff < ActiveRecord::Base
  
  load_mappings
  
  def self.find_person_id(staff_id)
    find(:first, :conditions => {_(:id) => staff_id})["#{_(:person_id)}"]
  end
  
end