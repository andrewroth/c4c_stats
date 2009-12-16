class StatsController < ApplicationController
  
  def index
    
    viewer_id = 3239#how will this be retrieved in the Pulse?
    
    @national_access = false;
    @regional_access = false;
    @campusdirector_access = false;
    #statscoordinator_access = false;
    @allstaff_access = false;
    
    accessgroup_ids = Vieweraccessgroup.find_access_ids(viewer_id)
    
    accessgroup_ids.each do |id|
      id = Integer(id['accessgroup_id'])
      puts ""
      puts id
      puts ""
      if id == permission_national
        @national_access = true;
        @regional_access = true;
        @campusdirector_access = true;
        @allstaff_access = true;
      elsif id == permission_regional
        @regional_access = true;
        @campusdirector_access = true;
        @allstaff_access = true;
      elsif id == permission_campusdirector
        @campusdirector_access = true;
        @allstaff_access = true;
      elsif id == permission_allstaff
        @allstaff_access = true;
      end
    end
    
  end
  
end
