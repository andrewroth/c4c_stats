class Vieweraccessgroup < ActiveRecord::Base
  
  load_mappings
  
  def self.find_access_ids(viewer_id)
    find(:all, :select => _(:accessgroup_id), :conditions => {_(:viewer_id) => viewer_id})
  end
end