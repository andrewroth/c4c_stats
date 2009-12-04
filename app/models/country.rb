class Country < ActiveRecord::Base
  
  load_mappings
  
  def self.find_country_id(description)
    find(:first, :conditions => ["#{_(:description)} <= ?",description]).id
  end

  
end