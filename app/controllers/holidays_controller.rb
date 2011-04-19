class HolidaysController < ApplicationController

def new
  @holiday = Holiday.new
end

def create
  @holiday = Holiday.create(params[:holiday])
  if @holiday.save
      redirect_to days_path, :notice => "A new holiday"
  else
    redirect_to days_path, :alert => "Failure to create a holiday"
  end
end

end
