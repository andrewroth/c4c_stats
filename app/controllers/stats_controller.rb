class StatsController < ApplicationController
  
  def index
    
  end
  
  def a_submit_weekly_stats
    
  end
  
  def a_indicated_decisions
    
  end
  
  def a_semester_at_a_glance
    
  end
  
  def a_year_summary
    
  end
  
  def c_semester_at_a_glance
    
  end
  
  def c_monthy_summary_by_campus
    
  end
  
  def r_summary_by_campus
    
  end
  
  def r_summary_by_month
    
  end
  
  def n_indicated_decisions
    
  end
  
  def n_hpctkc
    
  end
  
  def show_by_week
    #@month_id = (CimStatsMonth.find_by_month_desc params[:month]).month_id
    redirect_to :action => 'r_summary_by_week'
  end
  
end
