class Assignment < ActiveRecord::Base
  
  load_mappings
  belongs_to :status, :class_name => 'Status', :foreign_key => _(:id, :status)
  
  def self.find_staff_on_campus(campus_id)
    status_id = Status.find_status_id("Staff")
    find(:all, :conditions => {_(:campus_id) => campus_id, _(:status_id) => status_id})
  end
  
end