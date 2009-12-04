class AYearSummaryController < ApplicationController
  def index
    curMonth = "#{Date::MONTHNAMES[Time.now.month()]} #{Time.now.year()}"
    current_id = Month.find_year_id(curMonth)
    if !params[:yearSelected].nil? and !params[:campusSelected].nil?
      @campusSelected = params[:campusSelected]
      @campusID = Campus.find_campus_id(@campusSelected) 
      @yearSelected = params[:yearSelected]
      @yearID = Year.find_year_id(@yearSelected)      
    elsif params[:year].nil?
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
  
  def switch_controller
    redirect_to :controller => 'a_semester_at_a_glance', :action => 'index', :params => {"year"=> { "year" => @yearSelected, "campus" => @campusSelected }}
  end
  
end
