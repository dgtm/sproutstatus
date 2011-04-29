module DaysHelper
  def formatted_day(time)
    time.localtime.strftime(" %a, %B %d")
  end

  def day_text (time)
  

    @day_now = time.to_date
    @date_today = Time.now.utc.localtime("+05:45").to_date
    @ago = (@date_today - @day_now).to_i
        @may = { :ago => @ago }
    if (@day_now == @date_today)
      @may = {:absent_text => "Who's out?", :day => "Today"}
    elsif (@day_now == @date_today - 1.day)
      @may = {:absent_text => "Who was out?", :day => "Yesterday"}
    else
      @may = {:absent_text => "Who was out?", :day => "#{@ago} days ago"}
      end
    return @may
  end

  def formatted_time(time)
    time.localtime.strftime("%I:%M%p")
  end
end
