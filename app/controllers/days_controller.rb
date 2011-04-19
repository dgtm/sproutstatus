class DaysController < ApplicationController


def index

  ##Configure the hour and minute via the following array. Note that 5:30 PM is :hr => 17, :min => 30

  @schedules =
    [{
      :start_time => {:hr => 0, :min => 0},
      :end_time   => {:hr => 10, :min => 30},
      :message    => ["Wating+for+the+sunrise","Making our way to the office"],
      :state      => "Closed",
      :font       => ["Wating+for+the+sunrise","Times New Roman"]
    },
    {
      :start_time => {:hr => 10, :min => 31},
      :end_time   => {:hr => 17, :min => 30},
      :message    => ["Wating+for+the+sunset","Making our way from the office"],
      :state      => "Open",
      :font       => ["Wating+for+the+sunrise","Times New Roman"]

    }]

  @current_time = Time.now
  @date_today = DateTime.now
  
  ## Compare the current time with start and end time of each hash inside the @schedules array
  @schedules.each do |schedule|
    @scheduled_start_time = Time.new.change(:hour => schedule[:start_time][:hr], :min => schedule[:start_time][:min])
    @scheduled_end_time = Time.new.change(:hour => schedule[:end_time][:hr], :min => schedule[:end_time][:min])

#Priorities for @current_message
    # 3. Automatically Updated Statuses
    # 2. Holiday Statuses
    # 1. Admin Status
    #####################################
    
    
    # 3. Automatically Updated Statuses

    if (@current_time >= @scheduled_start_time && @current_time <= @scheduled_end_time)
        @current_status = schedule[:state]
        @current_message = schedule[:message][rand(schedule[:message].length)]
      break
      end
    end


  # 2. Holiday Statuses
  # The calendar creates a DateTime object by default. So, it is necessary to compare the DateTime and not just Date.

  if is_holiday(@date_today)
    @current_message = holiday_message(@date_today)
  end


  #  1. Admin Status
  if !admin_status.is_blank?
    @current_message = holiday_message(@date_today)
  end
  
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
