class HolidaysController < ApplicationController

def new
  @holiday = Holiday.new
end

def create
  if (params[:holiday][:start_at] == params[:holiday][:end_at])
    @holiday = Holiday.create(:start_at => params[:holiday][:start_at], :end_at => params[:holiday][:start_at], :name => params[:holiday][:name], :all_day =>true, :description => "Happy Holi to all the people all around the world")
  else
    @holiday = Holiday.create(params[:holiday])
  end

  if @holiday.save
      redirect_to holidays_path, :notice => "A new holiday was created"
  else
      render :action => 'new', :alert => "Failed to create a holiday"
  end
end

end
