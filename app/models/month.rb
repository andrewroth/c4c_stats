class Month < ActiveRecord::Base
  
  load_mappings
  
  def self.find_start_date(month_id)
    result = find(:first, :select => "#{_(:number)}, #{_(:calendar_year)}", :conditions => {_(:id) => month_id} )
    monthNum = result.number
    curYear = result.calendar_year
    startdate = "#{curYear}-#{monthNum}-#{00}"
    startdate
  end
  
  def self.find_end_date(month_id)
    result = find(:first, :select => "#{_(:number)}, #{_(:calendar_year)}", :conditions => {_(:id) => month_id} )
    monthNum = result.number
    curYear = result.calendar_year
    enddate = "#{curYear}-#{monthNum}-#{31}"
    enddate
  end
  
  def self.find_year_id(description)
    find(:first, :conditions => {_(:description) => description})["#{_(:year_id)}"]
  end
  
  def self.find_month_id(description)
    find(:first, :conditions => {_(:description) => description}).id
  end
  
  def self.find_month_description(id)
    find(:first, :conditions => {_(:id) => id}).description
  end
  
  def self.find_semester_id(description)
    find(:first, :conditions => {_(:description) => description})["#{_(:semester_id)}"]
  end
  
  def self.find_months_by_semester(semester_id)
    find(:all, :conditions => { _(:semester_id) => semester_id }, :order => _(:id))
  end
  
  def self.find_months(current_id)
    find(:all, :conditions => ["#{_(:id)} <= ?",current_id]).collect{ |m| [m.description]}
  end
  
end
