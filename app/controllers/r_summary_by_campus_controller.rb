class RSummaryByCampusController < ApplicationController
  
  def index
    
    if params[:region].nil?
      @regionID = nil
      curMonth = "#{Date::MONTHNAMES[Time.now.month()]} #{Time.now.year()}"
      @semesterID = Month.find_semester_id(curMonth)
      @semesterSelected = Semester.find_semester_description(@semesterID)
    else
      @semesterSelected = params[:region]['semester']
      @regionSelected = params[:region]['region']
      @semesterID = Semester.find_semester_id(@semesterSelected)
      @regionID = Region.find_region_id(@regionSelected)
      @campuses = Campus.find_campuses_by_region(@regionID)
    end
    country_id = Country.find_country_id("Canada")
    @regions = Region.find_regions(country_id)
    # the code below ensures that months that haven't occurred yet aren't listed    
    curMonth = "#{Date::MONTHNAMES[Time.now.month()]} #{Time.now.year()}"
    curID = Month.find_semester_id(curMonth)
    @semesters = Semester.find_semesters(curID)
    @curSemester = Semester.find_semester_description(curID)
    @yearSelected = Year.find_year_description(Semester.find_semester_year(@semesterID))
  end
  
end
