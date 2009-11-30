class Region < ActiveRecord::Base
  
  load_mappings
  belongs_to :campus, :class_name => 'Campus', :primary_key => _(:id),  :foreign_key => _(:id)
  
end