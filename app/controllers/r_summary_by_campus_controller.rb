class RSummaryByCampusController < ApplicationController
  
  def index
    if params[:campus].nil?
      @campusID = nil
      @monthID = nil
    else
      @campusSelected = params[:campus]['campus']
      @monthSelected = params[:campus]['month']
      @campusID = Campus.find_campus_id(@campusSelected) 
      @monthID = Month.find_month_id(@monthSelected)
    end
    # the code below ensures that months that haven't occurred yet aren't listed
    @curMonth = "#{Date::MONTHNAMES[Time.now.month()]} #{Time.now.year()}"
    curID = Month.find_month_id(@curMonth)
    @campuses = Campus.find_campuses()
    @months = Month.find_months(curID) 
  end
  
end
