class Status < ActiveRecord::Base
  
  load_mappings
  has_many :assignments, :class_name => 'Assignment', :foreign_key => _(:id)
  
  def self.find_status_id(description)
    find(:first, :conditions => {_(:description) => description}).id
  end
  
end