class RSummaryByMonthController < ApplicationController
  
  def index
    if params[:semester].nil?
      curMonth = "#{Date::MONTHNAMES[Time.now.month()]} #{Time.now.year()}"
      @semesterID = Month.find_semester_id(curMonth)
      @semesterSelected = Semester.find_semester_description(@semesterID)
    else
      @semesterSelected = params[:semester]['semester']
      @semesterID = Semester.find_semester_id(@semesterSelected)
    end
    @months = Month.find_months_by_semester(@semesterID)
    
    # the code below ensures that months that haven't occurred yet aren't listed    
    @curMonth = "#{Date::MONTHNAMES[Time.now.month()]} #{Time.now.year()}"
    curID = Month.find_semester_id(@curMonth)
    @semesters = Semester.find_semesters(curID)
 
  end
  
end
