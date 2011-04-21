class DaysController < ApplicationController

OPEN = "Open"
CLOSED = "Closed"



def index

# Find current, past and next day
  @current_day = params[:date] ? params[:date].to_date : Time.now.utc.localtime("+05:45").to_date
  @previous_day = @current_day - 1.day
  @next_day = @current_day + 1.day
  if (Time.now.utc.localtime("+05:45").to_date - @previous_day).to_i >= 7
    @previous_day = @current_day
  end
  if (@next_day - Time.now.utc.localtime("+05:45").to_date).to_i > 2
    @next_day = @current_day
  end
#parameters necessary for the calendar
  @month = (params[:month] || (Time.zone || Time).now.month).to_i
  @year = (params[:year] || (Time.zone || Time).now.year).to_i
  @shown_month = Date.civil(@year, @month)
  @event_strips = Holiday.event_strips_for_month(@shown_month)

##Configure the hour and minute via the following array. Note that 5:30 PM is :hr => 17, :min => 30

  @schedules =
    [{
      :start_time => {:hr => 0, :min => 0},
      :end_time   => {:hr => 7, :min => 0},
      :message    => ["Sleeping zzzzzzzzz.....","Don't you think we need some rest?"],
      :state      => "Closed",
      :font       => ["Wating+for+the+sunrise","Times New Roman"]
    },
    {
      :start_time => {:hr => 7, :min => 1},
      :end_time   => {:hr => 8, :min => 30},
      :message    => ["On our way to the office","At the parking lot"],
      :state      => "Closed",
      :font       => ["Wating+for+the+sunrise","Times New Roman"]

    },
    {
      :start_time => {:hr => 8, :min => 31},
      :end_time   => {:hr => 12, :min => 30},
      :message    => ["At the Office","Working"],
      :state      => "Open",
      :font       => ["Wating+for+the+sunrise","Times New Roman"]
    },
    {
      :start_time => {:hr => 12, :min => 31},
      :end_time   => {:hr => 13, :min => 30},
      :message    => ["At Lunch","Daal Bhat calling....."],
      :state      => "Open*",
      :font       => ["Wating+for+the+sunrise","Times New Roman"]

    },
    {
        :start_time => {:hr => 13, :min => 31},
        :end_time   => {:hr => 17, :min => 30},
        :message    => ["At the Office","Working hard","A tough day"],
        :state      => "Open",
        :font       => ["Wating+for+the+sunrise","Times New Roman"]
    },
    {
        :start_time => {:hr => 17, :min => 31},
        :end_time   => {:hr => 23, :min => 59},
        :message    => ["Home","Home"],
        :state      => "Closed",
        :font       => ["Wating+for+the+sunrise","Times New Roman"]

    }
    ]

  @current_time = Time.now.utc.localtime("+05:45")
  @local_time = Time.now.utc#.localtime("+05:45")

  @date_today = DateTime.now

## Compare the current time with start and end time of each hash inside the @schedules array
  @schedules.each do |schedule|
    #@scheduled_start_time = @local_time.change(:hour => schedule[:start_time][:hr], :min => schedule[:start_time][:min])#.utc.localtime("+05:45")
    #@scheduled_end_time = @local_time.change(:hour => schedule[:end_time][:hr], :min => schedule[:end_time][:min])#.utc.localtime("+05:45")
    @scheduled_start_time = Time.new(@current_time.year, @current_time.month, @current_time.day, schedule[:start_time][:hr], schedule[:start_time][:min], 0, "+05:45")
    @scheduled_end_time = Time.new(@current_time.year, @current_time.month, @current_time.day, schedule[:end_time][:hr], schedule[:end_time][:min], 0, "+05:45")

#Priorities for @current_message
    # 3. Automatically Updated Statuses
    # 2. Holiday Statuses
    # 1. Admin Status
    #####################################
    #debugger

    # 3. Automatically Updated Statuses
   if (@current_time >= @scheduled_start_time && @current_time <= @scheduled_end_time)
        @current_status = schedule[:state]
        @current_message = schedule[:message][rand(schedule[:message].length)]
      break
     end

  end


# 2. Holiday Statuses
     # The calendar creates a DateTime object by default. So, it is necessary to compare the DateTime and not just Date.
  if Holiday.is_holiday(@current_day)
    @current_message = Holiday.holiday_message(@current_day)
    @current_status = CLOSED
  end


#  1. Admin Status
        # if admin status is not empty
        # and created_at for this message is not more than 1 day
  if (!Admin.find(:all).empty?  && !Day.is_more_than_one_day( Admin.last.created_at.utc.localtime("+05:45").to_date ))
        @current_message = Admin.last.message

    elsif (!Admin.find(:all).empty?  && Day.is_more_than_one_day( Admin.last.created_at.utc.localtime("+05:45").to_date ))
          Admin.destroy_all
  end

  if (@current_day != Date.today) && (!Holiday.is_holiday(@current_day))
    @current_message = " "
    @current_status = " "
  end

end

end
