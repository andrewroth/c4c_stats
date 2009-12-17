class Region < ActiveRecord::Base
  
  load_mappings
  belongs_to :campus, :class_name => 'Campus', :primary_key => _(:id),  :foreign_key => _(:id)
  
  # This method will return an array of all regions associated with a given country
  def self.find_regions(country_id)
    find(:all, :conditions => ["#{_(:country_id)} <= ?",country_id]).collect{ |s| [s.description]}
  end
  
  # This method will return the region id associated with a given description
  def self.find_region_id(description)
    find(:first, :conditions => {_(:description) => description}).id
  end
  
end