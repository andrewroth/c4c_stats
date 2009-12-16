class AllStaffController < ApplicationController
  
  def year_summary
    curMonth = "#{Date::MONTHNAMES[Time.now.month()]} #{Time.now.year()}"
    current_id = Month.find_year_id(curMonth)
    if params[:year].nil?
      @campusID = nil
      @yearID = current_id
      @yearSelected = Year.find_year_description(@yearID)
    else
      @campusSelected = params[:year]['campus']
      @campusID = Campus.find_campus_id(@campusSelected) 
      @yearSelected = params[:year]['year']
      @yearID = Year.find_year_id(@yearSelected)
    end
    @years = Year.find_years(current_id)
    @campuses = Campus.find_campuses()
  end
  
  def submit_weekly_stats
    if params[:stats].present?
      
      # Error Checking
      error_message = "Please make sure a campus is selected and that each stat box has a valid numerical value."
      if params[:stats]['week'].nil? or params[:stats]['campus'].nil? or params[:stats]['sp_conv'].nil? or params[:stats]['sp_conv_std'].nil? or params[:stats]['gos_pres'].nil? or params[:stats]['gos_pres_std'].nil? or params[:stats]['hs_pres'].nil?
        # redirect_with_flash
        flash[:notice] = error_message
        redirect_to :action => 'submit_weekly_stats' and return
      else
        if !is_numeric?(params[:stats]['sp_conv']) or !is_numeric?(params[:stats]['sp_conv_std']) or !is_numeric?(params[:stats]['gos_pres']) or !is_numeric?(params[:stats]['gos_pres_std']) or !is_numeric?(params[:stats]['hs_pres'])
          # redirect_with_flash
          flash[:notice] = error_message
          redirect_to :action => 'submit_weekly_stats' and return
        end
      end
      # End Error Checking
      
      week_id = Week.find_week_id(params[:stats]['week'])
      campusSelected = params[:stats]['campus']
      campus_id = Campus.find_campus_id(campusSelected)
      sp_conv = Integer(params[:stats]['sp_conv'])
      sp_conv_std = Integer(params[:stats]['sp_conv_std'])
      gos_pres = Integer(params[:stats]['gos_pres'])
      gos_pres_std = Integer(params[:stats]['gos_pres_std'])
      hs_pres = Integer(params[:stats]['hs_pres'])
      semester_id = Week.find_semester_id(week_id)
      semesterSelected = Semester.find_semester_description(semester_id)
      #**************************#
      staff_id = 95 # NOTE: THIS NUMBER NEEDS TO BE ASSOCIATED WITH A VIEWER'S STAFF ID IN THE PULSE
      #**************************#
      Weeklyreport.submit_stats(week_id, campus_id, staff_id, sp_conv, sp_conv_std, gos_pres, gos_pres_std, hs_pres) 
      redirect_to :action => 'decisions', :decisions => {"campus" => campusSelected, "semester" => semesterSelected}  
    end  
    @weekSelected = Date.parse("#{Time.now.at_end_of_week.yesterday.year}-#{Time.now.at_end_of_week.yesterday.month}-#{Time.now.at_end_of_week.yesterday.day}")
    @weeks = Week.find_weeks()
    @campuses = Campus.find_campuses()
  end
  
  def semester_at_a_glance
    curMonth = "#{Date::MONTHNAMES[Time.now.month()]} #{Time.now.year()}"
    if params[:semester].nil?
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
  
  def indicated_decisions
    @curMonth = "#{Date::MONTHNAMES[Time.now.month()]} #{Time.now.year()}"
    curID = Month.find_semester_id(@curMonth)
    @semesters = Semester.find_semesters(curID)
    @semesterID = Month.find_semester_id(@curMonth)
    @semesterSelected = Semester.find_semester_description(@semesterID)
    @campuses = Campus.find_campuses()
  end
  
  
  def edit
    if params[:update].present? and params[:id].nil?
      @semesterSelected = params[:update]['semester']
      @semesterID = Semester.find_semester_id(@semesterSelected)
      id = params[:update]['id']
      @campusSelected = params[:update]['campus']
      @campusID = Campus.find_campus_id(@campusSelected)
      
 error_message = "Please make sure all required fields are filled in."
      #Error Checking
      if params[:update]['method'].nil? or params[:update]['day'].nil? or params[:update]['month'].nil? or params[:update]['year'].nil? or params[:update]['decision'].nil? or params[:update]['shared'].nil?
        # redirect_with_flash
        flash[:notice] = error_message
        redirect_to :action => :edit, :id => id, :semesterSelected => @semesterSelected, :campusSelected => @campusSelected, :delete => 0 and return
      end
      
      method = params[:update]['method']
      day = params[:update]['day']
      month = params[:update]['month']
      year = params[:update]['year']
      date = Date.parse("#{year}-#{month}-#{day}")
      if params[:update]['notes'].present?
        notes = params[:update]['notes']
      else 
        notes = nil
      end
      name = params[:update]['decision']
      witness = params[:update]['shared']
      believer = params[:update]['believer']
      Prc.update_decision(id, @semesterID, @campusID, methodID, date, notes, name, witness, believer)    
      redirect_to :action => 'decisions', :decisions => {"campus" => @campusSelected, "semester" => @semesterSelected}
    elsif params[:id].present? and params[:delete].nil?
      Prc.delete_by_id(params[:id])
      @semesterSelected = params[:update]['semester']
      @campusSelected = params[:update]['campus']
      redirect_to :action => 'decisions', :decisions => {"campus" => @campusSelected, "semester" => @semesterSelected}
    else
      @delete = Integer(params[:delete])
      id = params[:id]
      @decision = Prc.find_by_id(id)
      @campusSelected = params[:campusSelected]
      @campusID = Campus.find_campus_id(@campusSelected)
      @semesterSelected = params[:semesterSelected]
      @semesterID = Semester.find_semester_id(@semesterSelected)
      @years = [2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011]
      @months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
      @days = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31]
      @methods = Prcmethod.find_methods()
      @decisions = Prc.find_by_semester_and_campus(@semesterID,@campusID)
    end
  end
  
  def decisions
    if params[:decisions].present?
      @semesterSelected = params[:decisions]['semester']
      @semesterID = Semester.find_semester_id(@semesterSelected)
      @campusSelected = params[:decisions]['campus']
      @campusID = Campus.find_campus_id(@campusSelected)
    elsif params[:continue].present?
      @semesterSelected = params[:continue]['semester']
      @semesterID = Semester.find_semester_id(@semesterSelected)
      @campusSelected = params[:continue]['campus']
      @campusID = Campus.find_campus_id(@campusSelected)
      
      error_message = "Please make sure all required fields are filled in."
      #Error Checking
      if params[:continue]['method'].nil? or params[:continue]['day'].nil? or params[:continue]['month'].nil? or params[:continue]['year'].nil? or params[:continue]['decision'].nil? or params[:continue]['shared'].nil?
        # redirect_with_flash
        flash[:notice] = error_message
        redirect_to :action => 'decisions', :decisions =>{'semester' => @semesterSelected, 'campus' => @campusSelected} and return
      end
      
      method = params[:continue]['method']
      methodID = Prcmethod.find_method_id(method)
      day = params[:continue]['day']
      month = params[:continue]['month']
      year = params[:continue]['year']
      date = Date.parse("#{year}-#{month}-#{day}")
      if params[:continue]['notes'].present?
        notes = params[:continue]['notes']
      else 
        notes = nil
      end
      name = params[:continue]['decision']
      witness = params[:continue]['shared']
      believer = params[:continue]['believer']
      Prc.submit_decision(@semesterID, @campusID, methodID, date, notes, name, witness, believer)
    end
    @years = [2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011]
    @months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
    @days = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31]
    @methods = Prcmethod.find_methods()
    @decisions = Prc.find_by_semester_and_campus(@semesterID,@campusID)
  end
  
  def switch_controller
    redirect_to :action => 'semester_at_a_glance', :params => {"year"=> { "year" => @yearSelected, "campus" => @campusSelected }}
  end
  
  def is_numeric?(i)
    i.to_i.to_s == i || i.to_f.to_s == i
  end
  
  
end
