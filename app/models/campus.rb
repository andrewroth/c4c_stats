class Campus < ActiveRecord::Base
  
  load_mappings
  
  has_many :weekly_reports, :class_name => 'Weeklyreport', :foreign_key => _(:id)
  has_many :prcs, :class_name => 'Prc', :foreign_key => _(:id)
  has_many :regions, :class_name => 'Region', :primary_key => _(:id, :region), :foreign_key => _(:id, :region)
  
  def self.find_campus_id(description)
    find(:first, :conditions => {_(:description) => description}).id
  end
  
  def self.find_campus_description(id)
    find(:first, :conditions => {_(:id) => id}).description
  end
  
  def self.find_campus_id_from_short(short_description)
    find(:first, :conditions => {_(:short_description) => short_description}).id
  end
  
  def self.find_campuses()
    find(:all, :joins => :regions, :conditions => [ "#{__(:country_id, :region)} = ?", 1 ], :select => _(:description), :order => _(:description)).collect{ |c| [c.description]} 
  end

  def self.find_campuses_by_region(region_id)
    find(:all, :joins => :regions, :conditions => {"#{_(:id, :region)}" => region_id}, :select => _(:short_description), :order => _(:description)).collect{ |c| [c.short_description]} 
  end
  
end