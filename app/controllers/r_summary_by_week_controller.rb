class RSummaryByWeekController < ApplicationController
  def index
    if params[:month].nil?
      @monthID = nil
    else
      @monthSelected = params[:month]['month']
      @monthID = (CimStatsMonth.find_by_month_desc @monthSelected).month_id
      @weeks = CimStatsWeek.find(:all, :select => :week_id, :conditions => { :month_id => @monthID }, :order => :week_id)   
    end
    @months = CimStatsMonth.all.collect{ |m| [m.month_desc]} 
  end
  
end
