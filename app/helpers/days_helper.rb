module DaysHelper
  def formatted_day(time)
    time.localtime.strftime(" %a, %B %d")
  end

  def day_text (time)
    @day_now = time.to_date
    @date_today = Time.now.utc.localtime("+05:45").to_date
    @ago = (@date_today - @day_now).to_i
    if (@day_now == @date_today)
      @day = "Today"
    elsif (@day_now == @date_today - 1.day)
      @day = "Yesterday"
    elsif (@day_now == @date_today + 1.day)
      @day = "Tomorrow"
      elsif (@day_now == @date_today + 2.day)
        @day = "Day after Tomorrow"
    else
      @day = "#{@ago} days ago"
    end
    return @day
  end

  def formatted_time(time)
    time.localtime.strftime("%I:%M%p")
  end
end
