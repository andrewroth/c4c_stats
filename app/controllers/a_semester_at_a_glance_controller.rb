class ASemesterAtAGlanceController < ApplicationController
  
  def index
    curMonth = "#{Date::MONTHNAMES[Time.now.month()]} #{Time.now.year()}"
    if !params[:campusSelected].nil? and !params[:semesterSelected].nil? 
      @campusSelected = params[:campusSelected]
      @semesterSelected = params[:semesterSelected]
      @campusID = Campus.find_campus_id(@campusSelected) 
      @semesterID = Semester.find_semester_id(@semesterSelected)
      @staff = Weeklyreport.find_staff(@semesterID, @campusID)
      @weeks = Week.find_weeks_in_semester(@semesterID)
      @months = Month.find_months_by_semester(@semesterID)  
    elsif params[:semester].nil?
      @campusID = nil
      @semesterID = Month.find_semester_id(curMonth)
      @semesterSelected = Semester.find_semester_description(@semesterID)
    else
      @campusSelected = params[:semester]['campus']
      @semesterSelected = params[:semester]['semester']
      @campusID = Campus.find_campus_id(@campusSelected) 
      @semesterID = Semester.find_semester_id(@semesterSelected)
      @staff = Weeklyreport.find_staff(@semesterID, @campusID)
      @weeks = Week.find_weeks_in_semester(@semesterID)
      @months = Month.find_months_by_semester(@semesterID)      
    end
    @campuses = Campus.find_campuses()
    
    # the code below ensures that months that haven't occurred yet aren't listed    
    curID = Month.find_semester_id(curMonth)
    @semesters = Semester.find_semesters(curID)
    @curSemester = Semester.find_semester_description(curID)
    
  end
  
end
