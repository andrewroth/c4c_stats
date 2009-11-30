class NIndicatedDecisionsController < ApplicationController
  
  def index
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
  
end
