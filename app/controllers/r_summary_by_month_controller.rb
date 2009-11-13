class RSummaryByMonthController < ApplicationController
  def index
    if params[:semester].nil?
      @semesterID = nil
    else
      @semesterSelected = params[:semester]['semester']
      @semesterID = (CimStatsSemester.find_by_semester_desc @semesterSelected).semester_id
      @months = CimStatsMonth.find(:all, :select => 'month_id, month_desc', :conditions => { :semester_id => @semesterID }, :order => :month_id)   
    end
    @semesters = CimStatsSemester.all.collect{ |s| [s.semester_desc]} 
  end

end
