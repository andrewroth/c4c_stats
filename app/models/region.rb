class Region < ActiveRecord::Base
  
  load_mappings
  belongs_to :campus, :class_name => 'Campus', :primary_key => _(:id),  :foreign_key => _(:id)
  
  def self.find_regions(country)
    find(:all, :conditions => ["#{_(:country_id)} <= ?",country]).collect{ |s| [s.description]}
  end
  
  def self.find_region_id(description)
    find(:first, :conditions => {_(:description) => description}).id
  end
  
end