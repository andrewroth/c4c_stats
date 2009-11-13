class CimStatsPrc < ActiveRecord::Base
  
  set_table_name :cim_stats_prc
  
  def self.count_by_date(start_date,end_date,region_id)
    if region_id == 4
      result = self.count(:all, :joins => "INNER JOIN cim_hrdb_campus ON cim_stats_prc.campus_id = cim_hrdb_campus.campus_id", :conditions => ["region_id != ? AND prc_date <= ? AND prc_date > ?",region_id,end_date,start_date])
    else
      result = self.count(:all, :joins => "INNER JOIN cim_hrdb_campus ON cim_stats_prc.campus_id = cim_hrdb_campus.campus_id", :conditions => ["region_id = ? AND prc_date <= ? AND prc_date > ?",region_id,end_date,start_date])
    end
    result
  end
  
  def self.count_by_semester(semester_id,region_id)
    if region_id == 4
      result = self.count(:all, :joins => "INNER JOIN cim_hrdb_campus ON cim_stats_prc.campus_id = cim_hrdb_campus.campus_id", :conditions => ["region_id != ? AND semester_id = ?",region_id,semester_id])
    else
      result = self.count(:all, :joins => "INNER JOIN cim_hrdb_campus ON cim_stats_prc.campus_id = cim_hrdb_campus.campus_id", :conditions => ["region_id = ? AND semester_id = ?",region_id,semester_id])
    end
    result
  end
  
end
