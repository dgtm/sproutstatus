class HolidaysController < ApplicationController

def new
  @holiday = Holiday.new
end

def create
  if (params[:holiday][:start_at] == params[:holiday][:end_at])
    @holiday = Holiday.create(:start_at => params[:holiday][:start_at], :name => params[:holiday][:name], :all_day =>true)
  else
    @holiday = Holiday.create(params[:holiday])
  end

  if @holiday.save
      redirect_to days_path, :notice => "A new holiday"
  else
      render :action => 'new', :alert => "Failed to create a holiday"
  end
end

end
