class NationalTeamController < ApplicationController
  
  def how_people_prayed_to_receive_christ
    curMonth = "#{Date::MONTHNAMES[Time.now.month()]} #{Time.now.year()}"
    current_id = Month.find_year_id(curMonth)
    if params[:year].nil?
      @yearID = current_id
      @yearSelected = Year.find_year_description(@yearID)
    else
      @yearSelected = params[:year]['year']
      @yearID = Year.find_year_id(@yearSelected)
    end
    # the code below ensures that months that haven't occurred yet aren't listed
    @years = Year.find_years(current_id)
    @methods = Array.new(14){0}
    @completed = Array.new(14){0}
    @total = 0 
    calculations(@yearID)
  end
  
  def calculations(yearID)
    semesters = Semester.find_semesters_by_year(yearID)
    semesters.each do |semester|
      prcs = semester.prc
      prcs.each do |prc|
        @total += 1
        @methods[prc.prcMethod_id] += 1
        if prc.prc_7upCompleted == 1
          @completed[prc.prcMethod_id] += 1
        end
      end
    end
  end
  
  def indicated_decisions
    curMonth = "#{Date::MONTHNAMES[Time.now.month()]} #{Time.now.year()}"
    if params[:semester].nil?
      @semesterID = Month.find_semester_id(curMonth)
      @semesterSelected = Semester.find_semester_description(@semesterID)
    else
      @semesterSelected = params[:semester]['semester']
      @semesterID = Semester.find_semester_id(@semesterSelected)  
    end
    @campuses = Campus.find_campuses()
    
    # the code below ensures that months that haven't occurred yet aren't listed    
    curID = Month.find_semester_id(curMonth)
    @semesters = Semester.find_semesters(curID)
    @curSemester = Semester.find_semester_description(curID)
    
  end
end
