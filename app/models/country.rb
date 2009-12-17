class Country < ActiveRecord::Base
  
  load_mappings
  
  # This method will return the county id associated with a given description
  def self.find_country_id(description)
    find(:first, :conditions => ["#{_(:description)} <= ?",description]).id
  end

  
end