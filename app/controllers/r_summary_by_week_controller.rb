class RSummaryByWeekController < ApplicationController
  def index
    if params[:month].nil?
      @monthSelected = "#{Date::MONTHNAMES[Time.now.month()]} #{Time.now.year()}"
    else
      @monthSelected = params[:month]['month']
    end
    @monthID = Month.find_month_id(@monthSelected)
    @weeks = Week.find_weeks_in_month(@monthID)
    
    # the code below ensures that months that haven't occurred yet aren't listed    
    @curMonth = "#{Date::MONTHNAMES[Time.now.month()]} #{Time.now.year()}"
    curID = Month.find_month_id(@curMonth)
    @months = Month.find_months(curID)
  end
  
end
