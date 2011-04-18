class DaysController < ApplicationController


def index

  ##Configure the hour and minute via the following array

  @schedules =
    [{
      :start_time => {:hr =>0, :min =>0},
      :end_time   => {:hr =>10, :min =>30},
      :message    => ["Wating+for+the+sunrise","Making our way to the office"],
      :state      => "Closed",
      :font       => ["Wating+for+the+sunrise","Times New Roman"]
    },
    {
      :start_time => {:hr =>10, :min =>31},
      :end_time   => {:hr =>17, :min =>30},
      :message    => ["Wating+for+the+sunset","Making our way from the office"],
      :state      => "Open",
      :font       => ["Wating+for+the+sunrise","Times New Roman"]

    }]

  @current_time = Time.now

  ## Compare the current time with start and end time of each hash inside the @schedules array
  @schedules.each do |schedule|
    @scheduled_start_time = Time.new.change(:hour => schedule[:start_time][:hr], :min => schedule[:start_time][:min])
    @scheduled_end_time = Time.new.change(:hour => schedule[:end_time][:hr], :min => schedule[:end_time][:min])

    ## if an admin status is not set

    if (@current_time >= @scheduled_start_time && @current_time <= @scheduled_end_time)
        @current_status = schedule[:state]
        @current_message = schedule[:message][rand(schedule[:message].length)]
      break
      end
    end


  # Check for admin status message (it overrides default!)

  # Check holidays

  # Check default schedule
    # loop through the schedule timings to find current timing window

    # pick a random message from that timing window

end

def new
  @day = Day.new
end

def create
  @day = Day.create(:date => Date.today, :status => ON_A_BREAK)
  if @day.save
      redirect_to days_path, :notice => "A new dawn"
  else
    redirect_to days_path, :notice => "Failure to create a day"
  end
end

def edit
  @day = Day.find(params[:id])
end

def update
  @day = Day.find(params[:id])
  if @day.update_attributes(params[:day])
          redirect_to days_path, :notice => "Updated"
  else
          redirect_to days_path, :alert => "Update failure"
  end
end


end
